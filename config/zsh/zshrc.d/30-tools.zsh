# 30-tools.zsh — shell integrations. Each is skipped silently if absent.

# zoxide (smarter cd)
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"

# atuin (shell history)
command -v atuin >/dev/null 2>&1 && eval "$(atuin init zsh)"

# broot (tree navigator)
[[ -s "$HOME/.config/broot/launcher.sh" ]] && source "$HOME/.config/broot/launcher.sh"

# NOTE: no prompt framework is enabled here on purpose. The prompt comes from
# the oh-my-zsh theme. Want starship? Put this in zshrc.d/90-local.zsh:
#   eval "$(starship init zsh)"

# Rebind autosuggestion widgets AFTER tool inits, which clobber them.
if (( $+widgets[autosuggest-accept] )); then
  bindkey '^[[C' autosuggest-accept
  bindkey '^[[B' autosuggest-next
  bindkey '^[OC' autosuggest-accept
  bindkey '^[[B' autosuggest-forward-and-down 2>/dev/null
fi

# fzf-tab previews — same zstyles as the original, including $realtime.
if (( $+widgets[fzf-tab-complete] )); then
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realtime' 2>/dev/null
  zstyle ':fzf-tab:complete:kill:argument-1' fzf-preview 'ps -fp $word' 2>/dev/null
  zstyle ':fzf-tab' fzf-bindings 'ctrl-s:toggle-sort' 2>/dev/null
fi
