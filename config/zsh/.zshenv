# anoraK — runs for EVERY zsh (scripts, cron, ssh command, non-interactive).
# Only difference from the original: the cargo env is guarded, so a machine
# without Rust does not print an error on every non-interactive shell.

[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
