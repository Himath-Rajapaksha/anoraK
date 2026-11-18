#!/usr/bin/env bash
# ==========================================================================
#  anoraK — rebuild this environment on a new machine.
#
#    ./bootstrap.sh                 install everything for the current user
#    ./bootstrap.sh --dry-run       show what would change, touch nothing
#    ./bootstrap.sh --only shell    just relink the shell config
#    ./bootstrap.sh --no-packages   skip package installation
#    sudo ./bootstrap.sh --user anorak
#
#  Safe to run repeatedly. Conflicts are backed up, never deleted.
# ==========================================================================
set -euo pipefail

# ---- locate the repo, even through a symlink ----------------------------
_self="${BASH_SOURCE[0]}"
while [[ -L "$_self" ]]; do
  _dir="$(cd -P "$(dirname "$_self")" && pwd)"
  _self="$(readlink "$_self")"
  [[ "$_self" == /* ]] || _self="$_dir/$_self"
done
ANORAK_ROOT="$(cd -P "$(dirname "$_self")" && pwd)"
export ANORAK_ROOT
unset _self _dir

# ---- defaults -----------------------------------------------------------
DRY=0
ONLY=""
SKIP_PKGS=0
TARGET_USER="${ANORAK_USER:-}"

usage() {
  sed -n '2,14p' "$ANORAK_ROOT/bootstrap.sh" | sed 's/^# \{0,1\}//'
  cat <<'EOF'

Phases for --only:
  packages   package manager installs from packages/<os>.txt
  fonts      bundled fonts into the per-OS font directory
  shell      ~/.zshrc, ~/.zshenv, oh-my-zsh theme + plugins
  terminal   ~/.config/ghostty
  git        ~/.gitconfig
  opencode   ~/.config/opencode and the rendered opencode.json
  all        everything (default)
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run)      DRY=1 ;;
    --no-packages)  SKIP_PKGS=1 ;;
    --only)         ONLY="${2:-all}"; shift ;;
    --user|-u)      TARGET_USER="${2:-}"; shift ;;
    -h|--help)      usage; exit 0 ;;
    *)              printf 'unknown option: %s\n\n' "$1" >&2; usage; exit 1 ;;
  esac
  shift
done
[[ "$ONLY" == all ]] && ONLY=""

# ---- load helpers -------------------------------------------------------
for _lib in "$ANORAK_ROOT"/lib/*.sh; do source "$_lib"; done
unset _lib

# ---- environment --------------------------------------------------------
OS="$(detect_os)"
resolve_target_user
detect_ghidra

want() { [[ -z "$ONLY" || "$ONLY" == "$1" ]]; }

banner() {
  printf '%s\n' "anoraK"
  printf '  repo    %s\n' "$ANORAK_ROOT"
  printf '  os      %s\n' "$OS"
  printf '  user    %s\n' "$TARGET_USER"
  printf '  home    %s\n' "$TARGET_HOME"
  (( DRY )) && printf '  mode    DRY RUN — nothing will change\n'
  printf '\n'
}

# ---- phases -------------------------------------------------------------

phase_packages() {
  step "packages ($OS)"
  if (( SKIP_PKGS )); then log "skipped (--no-packages)"; return 0; fi
  install_packages "$OS"
}

phase_fonts() {
  step "fonts"
  install_fonts
}

phase_shell() {
  step "shell"

  local zshdir="$ANORAK_ROOT/config/zsh"

  # Machine-specific fragment, created once and then never touched again.
  if [[ ! -f "$zshdir/zshrc.d/90-local.zsh" ]]; then
    if (( DRY )); then
      dry "create zshrc.d/90-local.zsh"
    else
      as_target cp "$zshdir/zshrc.d/90-local.zsh.example" "$zshdir/zshrc.d/90-local.zsh"
      ok "created 90-local.zsh (gitignored)"
    fi
  fi

  link_path "$zshdir/.zshrc"  "$TARGET_HOME/.zshrc"
  link_path "$zshdir/.zshenv" "$TARGET_HOME/.zshenv"

  # oh-my-zsh is optional; without it the fallback prompt in 00-omz.zsh runs.
  local omz="$TARGET_HOME/.oh-my-zsh"
  if [[ -d "$omz" ]]; then
    link_path "$zshdir/themes/macos-zsh-theme" \
              "$omz/custom/themes/macos-zsh-theme"

    local url dir
    while read -r url dir; do
      [[ -n "$url" && "$url" != \#* ]] || continue
      local target="$omz/custom/plugins/$dir"
      if [[ -d "$target" ]]; then
        log "plugin present: $dir"
      elif (( DRY )); then
        dry "clone $dir"
      else
        log "cloning $dir"
        as_target git clone --depth 1 --quiet "$url" "$target" 2>/dev/null \
          && ok "$dir" || warn "clone failed: $dir"
      fi
    done < "$zshdir/custom-plugins.txt"
  else
    warn "oh-my-zsh not installed — run: sh -c \"\$(curl -fsSL https://install.ohmyz.sh)\""
    warn "the shell will still work, with a minimal prompt"
  fi
}

phase_terminal() {
  step "terminal (ghostty)"
  link_dir "$ANORAK_ROOT/config/ghostty" "$TARGET_HOME/.config/ghostty"
  if ! command -v ghostty >/dev/null 2>&1 && [[ "$OS" != macos ]]; then
    warn "ghostty binary not found — install it, the config is already in place"
  fi
}

phase_git() {
  step "git"
  link_path "$ANORAK_ROOT/config/git/gitconfig" "$TARGET_HOME/.gitconfig"
}

phase_opencode() {
  step "opencode"
  ensure_env_file
  wire_opencode
}

summary() {
  printf '\n'
  [[ -n "$ONLY" ]] && { ok "phase '$ONLY' complete"; return 0; }
  ok "done"
  printf '\n'
  printf '  next:\n'
  printf '    1. fill in %s\n' "$ANORAK_ROOT/secrets/.env"
  printf '    2. open a new terminal (or run: exec zsh -l)\n'
  printf '    3. put machine-only settings in config/zsh/zshrc.d/90-local.zsh\n'
  printf '\n'
}

# ---- run ----------------------------------------------------------------
banner

if [[ -n "$ONLY" ]]; then
  case "$ONLY" in
    packages) phase_packages ;;
    fonts)    phase_fonts ;;
    shell)    phase_shell ;;
    terminal) phase_terminal ;;
    git)      phase_git ;;
    opencode) phase_opencode ;;
    *)        die "unknown phase: $ONLY" ;;
  esac
else
  phase_packages
  phase_fonts
  phase_shell
  phase_terminal
  phase_git
  phase_opencode
fi

summary
