# 30-tools.zsh — shell integrations. Each is skipped silently if absent.

# zoxide (smarter cd)
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"

# atuin (shell history)
command -v atuin >/dev/null 2>&1 && eval "$(atuin init zsh --disable-up-arrow)"

# broot (tree navigator)
[[ -s "$HOME/.config/broot/launcher.sh" ]] && source "$HOME/.config/broot/launcher.sh"

# direnv
command -v direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"

# starship / prompt override, only if the user installed it
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# Rebind autosuggestion widgets AFTER tool inits, which clobber them.
if (( $+widgets[autosuggest-accept] )); then
  bindkey '^[[C'  autosuggest-accept 2>/dev/null
  bindkey '^[OC'  autosuggest-accept 2>/dev/null
  bindkey '^[[B'  autosuggest-next   2>/dev/null
fi

# fzf-tab previews
if (( $+widgets[fzf-tab-complete] )); then
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' 2>/dev/null
  zstyle ':fzf-tab:complete:kill:argument-1' fzf-preview 'ps -fp $word' 2>/dev/null
  zstyle ':fzf-tab' fzf-bindings 'ctrl-s:toggle-sort' 2>/dev/null
fi
