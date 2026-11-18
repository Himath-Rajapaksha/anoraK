# anoraK/lib/10-detect.sh — OS, user, privilege

detect_os() {
  case "$(uname -s)" in
    Darwin) printf 'macos' ; return 0 ;;
    Linux)
      local id=''
      [[ -r /etc/os-release ]] && id="$( . /etc/os-release; printf '%s' "${ID:-}" )"
      case "$id" in
        debian|ubuntu|linuxmint|pop|kali|raspbian|neon|elementary|zorin) printf 'debian' ;;
        fedora|rhel|rocky|almalinux|centos|ol)                          printf 'fedora' ;;
        arch|manjaro|endeavouros|garuda|artix)                          printf 'arch'   ;;
        *)                                                              printf 'linux'  ;;
      esac
      return 0 ;;
    *) printf 'unknown' ;;
  esac
}

resolve_target_user() {
  if [[ -z "${TARGET_USER:-}" ]]; then
    if [[ $EUID -eq 0 ]]; then
      TARGET_USER="${SUDO_USER:-}"
      [[ -n "$TARGET_USER" && "$TARGET_USER" != root ]] \
        || die "running as root: pass --user <name> to choose whose dotfiles to install"
    else
      TARGET_USER="$(id -un)"
    fi
  fi
  id -u "$TARGET_USER" >/dev/null 2>&1 || die "no such user: $TARGET_USER"
  TARGET_HOME="$(getent passwd "$TARGET_USER" 2>/dev/null | cut -d: -f6)"
  [[ -n "$TARGET_HOME" ]] || TARGET_HOME="$(eval printf '%s' "~$TARGET_USER")"
  [[ -d "$TARGET_HOME" ]] || die "home directory missing for $TARGET_USER: $TARGET_HOME"
  export TARGET_USER TARGET_HOME
}

# Run a command as the target user (identity-preserving when not root).
as_target() {
  if [[ $EUID -ne 0 || "$TARGET_USER" == root ]]; then
    "$@"; return $?
  fi
  if command -v sudo >/dev/null 2>&1; then
    sudo -u "$TARGET_USER" "$@"
  elif command -v runuser >/dev/null 2>&1; then
    runuser -u "$TARGET_USER" -- "$@"
  else
    su -s /bin/sh "$TARGET_USER" -c "$(printf '%q ' "$@")"
  fi
}

needs_sudo() {
  [[ $EUID -eq 0 ]] && return 1
  command -v sudo >/dev/null 2>&1 || { warn "sudo not found — skipping: $*"; return 1; }
  return 0
}

# Ghidra is not in any distro repo, so we find whatever build is installed.
detect_ghidra() {
  [[ -n "${GHIDRA_INSTALL_DIR:-}" ]] && return 0
  local d=''
  if [[ -d /opt/ghidra ]]; then
    d="$(ls -d /opt/ghidra/ghidra_*_PUBLIC 2>/dev/null | sort -V | tail -1)"
  elif [[ -d "$TARGET_HOME/ghidra" ]]; then
    d="$TARGET_HOME/ghidra"
  fi
  [[ -n "$d" ]] && export GHIDRA_INSTALL_DIR="$d"
  return 0
}
