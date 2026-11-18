# 00-omz.zsh — oh-my-zsh is optional. Everything else works without it.
export ZSH="${ZSH:-$HOME/.oh-my-zsh}"

if [[ -r "$ZSH/oh-my-zsh.sh" ]]; then
  ZSH_THEME="macos-zsh-theme/macos-theme"

  # Only enable plugins that are actually installed (stock or custom dir).
  typeset -a plugins
  plugins=()
  for _p in git fzf zsh-syntax-highlighting zsh-completions \
            zsh-autosuggestions zsh-autopair fzf-tab zsh-you-should-use \
            sudo docker npm zoxide; do
    if [[ -d "$ZSH/plugins/$_p" || -d "$ZSH/custom/plugins/$_p" ]]; then
      plugins+=("$_p")
    fi
  done
  unset _p

  # The theme is vendored upstream (cloned by bootstrap). If it is missing,
  # fall back rather than warning on every shell.
  if [[ ! -f "$ZSH/custom/themes/macos-zsh-theme/macos-theme.zsh-theme" ]]; then
    ZSH_THEME="robbyrussell"
  fi

  source "$ZSH/oh-my-zsh.sh"
else
  # Minimal prompt so the shell is still usable on a bare machine.
  autoload -Uz colors && colors
  PROMPT='%F{green}%n@%m%f:%F{blue}%~%f %# '
  RPROMPT='%(?..%F{red}[%?]%f)'
fi
