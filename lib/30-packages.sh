# anoraK/lib/30-packages.sh — install from packages/<os>.txt
# Every package installs independently: one unknown name never aborts the run.

_sudo() {
  if [[ $EUID -eq 0 ]]; then "$@"
  elif command -v sudo >/dev/null 2>&1; then sudo "$@"
  else die "need root for: $*"
  fi
}

install_packages() {
  local os="$1"
  local list="$ANORAK_ROOT/packages/$os.txt"

  if [[ ! -r "$list" ]]; then
    warn "no package list for '$os' ($list) — skipping"
    return 0
  fi

  local -a pkgs=()
  local line
  while IFS= read -r line || [[ -n "$line" ]]; do
    line="${line%%#*}"
    line="${line//[[:space:]]/}"
    [[ -n "$line" ]] && pkgs+=("$line")
  done < "$list"

  (( ${#pkgs[@]} )) || { log "package list empty"; return 0; }
  log "installing ${#pkgs[@]} packages for $os"

  local p
  case "$os" in
    debian)
      _sudo apt-get update -qq >/dev/null 2>&1 || warn "apt-get update had errors"
      for p in "${pkgs[@]}"; do
        if (( DRY )); then dry "apt install $p"; continue; fi
        _sudo env DEBIAN_FRONTEND=noninteractive \
          apt-get install -y --no-install-recommends "$p" >/dev/null 2>&1 \
          && ok "$p" || warn "skipped: $p"
      done
      ;;

    fedora)
      for p in "${pkgs[@]}"; do
        if (( DRY )); then dry "dnf install $p"; continue; fi
        if [[ "$p" == @* ]]; then
          _sudo dnf group install -y "${p#@}" >/dev/null 2>&1 \
            && ok "${p}" || warn "skipped group: $p"
        else
          _sudo dnf install -y "$p" >/dev/null 2>&1 \
            && ok "$p" || warn "skipped: $p"
        fi
      done
      ;;

    macos)
      if ! command -v brew >/dev/null 2>&1; then
        warn "Homebrew not installed — see https://brew.sh, then re-run"
        return 1
      fi
      for p in "${pkgs[@]}"; do
        if (( DRY )); then dry "brew install $p"; continue; fi
        if brew list "$p" >/dev/null 2>&1; then ok "$p (present)"
        else brew install "$p" >/dev/null 2>&1 && ok "$p" || warn "skipped: $p"
        fi
      done
      ;;

    arch)
      for p in "${pkgs[@]}"; do
        (( DRY )) && { dry "pacman -S $p"; continue; }
        _sudo pacman -S --needed --noconfirm "$p" >/dev/null 2>&1 \
          && ok "$p" || warn "skipped: $p"
      done
      ;;

    *)
      warn "unsupported distro '$os' — install packages/<os>.txt by hand"
      ;;
  esac
  return 0
}
