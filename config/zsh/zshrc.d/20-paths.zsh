# 20-paths.zsh — PATH assembly. Only existing directories are added.
# Prepend order = precedence order.

_anoraK_prepend() {
  local d
  for d in "$@"; do
    [[ -n "$d" && -d "$d" ]] || continue
    case ":$PATH:" in
      *":$d:"*) ;;
      *) PATH="$d:$PATH" ;;
    esac
  done
  export PATH
}

_anoraK_prepend \
  "$HOME/.local/bin" \
  "$HOME/.opencode/bin" \
  "$HOME/.bun/bin" \
  "$HOME/.npm-global/bin" \
  "$HOME/.atuin/bin" \
  "$HOME/.kimi-code/bin" \
  "$HOME/.mimocode/bin" \
  "$HOME/.qoder" \
  "$HOME/.cargo/bin" \
  "$HOME/bin" \
  "$HOME/.asdf/bin" \
  "$HOME/.local/state/fnm_multishells" 2>/dev/null

unfunction _anoraK_prepend

# --- Homebrew ------------------------------------------------------------
# Linuxbrew on Debian/Fedora, Apple Silicon, Intel Mac — whichever exists.
for _brew_prefix in /home/linuxbrew/.linuxbrew /opt/homebrew /usr/local; do
  if [[ -x "$_brew_prefix/bin/brew" ]]; then
    eval "$("$_brew_prefix/bin/brew" shellenv)"
    break
  fi
done
unset _brew_prefix

# --- Go ------------------------------------------------------------------
[[ -d /usr/local/go/bin ]] && case ":$PATH:" in
  *":/usr/local/go/bin:"*) ;;
  *) PATH="/usr/local/go/bin:$PATH" ;;
esac

# --- bun completions -----------------------------------------------------
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

# --- nvm -----------------------------------------------------------------
export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# --- sdkman --------------------------------------------------------------
export SDKMAN_DIR="${SDKMAN_DIR:-$HOME/.sdkman}"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# --- Ghidra (reverse engineering) ---------------------------------------
# Version-independent: pick whatever is installed, don't hardcode a build.
if [[ -d /opt/ghidra ]]; then
  _anoraK_ghidra="$(ls -d /opt/ghidra/ghidra_*_PUBLIC 2>/dev/null | sort -V | tail -1)"
  if [[ -n "$_anoraK_ghidra" ]]; then
    export GHIDRA_INSTALL_DIR="$_anoraK_ghidra"
    export GHIDRA_HOME="$_anoraK_ghidra"
  fi
  unset _anoraK_ghidra
elif [[ -d "$HOME/ghidra" ]]; then
  export GHIDRA_HOME="$HOME/ghidra"
  export GHIDRA_INSTALL_DIR="$HOME/ghidra"
fi
