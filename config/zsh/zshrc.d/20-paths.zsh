# 20-paths.zsh — PATH, reconstructed in the original's effective order.
#
# The original built PATH in several passes. After duplicate removal the
# precedence was:
#   ~/ghidra, ~/.local/bin, /usr/local/go/bin, ~/.cargo/bin, ~/.opencode/bin,
#   ~/.mimocode/bin, ~/.kimi-code/bin, ~/.qoder, ~/.npm-global/bin,
#   ~/.bun/bin, ~/.atuin/bin, <nvm>, <sdkman>, <homebrew>, <system>
# This file produces exactly that order, once.

export BUN_INSTALL="${BUN_INSTALL:-$HOME/.bun}"
export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
export SDKMAN_DIR="${SDKMAN_DIR:-$HOME/.sdkman}"

# --- Homebrew ------------------------------------------------------------
# Linuxbrew on Debian/Fedora, Apple Silicon, Intel Mac — whichever exists.
for _brew_prefix in /home/linuxbrew/.linuxbrew /opt/homebrew /usr/local; do
  if [[ -x "$_brew_prefix/bin/brew" ]]; then
    eval "$("$_brew_prefix/bin/brew" shellenv)"
    break
  fi
done
unset _brew_prefix

# --- nvm -----------------------------------------------------------------
# Sourced before the main PATH export, so its node bin sits behind the user
# directories — which is where the original ended up.
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# --- sdkman --------------------------------------------------------------
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# --- atuin shell env -----------------------------------------------------
[[ -s "$HOME/.atuin/bin/env" ]] && source "$HOME/.atuin/bin/env"

# --- the path itself -----------------------------------------------------
export PATH="$HOME/ghidra:$HOME/.local/bin:/usr/local/go/bin:$HOME/.cargo/bin:$HOME/.opencode/bin:$HOME/.mimocode/bin:$HOME/.kimi-code/bin:$HOME/.qoder:$HOME/.npm-global/bin:$HOME/.bun/bin:$HOME/.atuin/bin:$PATH"

# --- bun completions -----------------------------------------------------
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

# --- Ghidra (reverse engineering) ---------------------------------------
# The original exported GHIDRA_HOME and a hardcoded GHIDRA_INSTALL_DIR that
# did not exist. The home stays identical; the install dir is only set when
# a build is actually present.
export GHIDRA_HOME="$HOME/ghidra"

if [[ -d /opt/ghidra ]]; then
  _anoraK_ghidra="$(ls -d /opt/ghidra/ghidra_*_PUBLIC 2>/dev/null | sort -V | tail -1)"
  [[ -n "$_anoraK_ghidra" ]] && export GHIDRA_INSTALL_DIR="$_anoraK_ghidra"
  unset _anoraK_ghidra
fi
