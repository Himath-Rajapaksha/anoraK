# anoraK — runs for EVERY zsh (scripts, cron, ssh command, non-interactive).
# Keep this tiny and side-effect-free.

# Rust toolchain, if present.
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Make every zsh able to find user-local binaries.
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) export PATH="$HOME/.local/bin:$PATH" ;;
esac
