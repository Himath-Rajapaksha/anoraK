# 40-aliases.zsh — the aliases from the original ~/.zshrc, in the same order,
# with the same meanings. Nothing added, nothing reworded.
#
# Aliases that need a binary live in 45-aliases-modern.zsh behind a
# `command -v` test, so a machine without that binary still loads cleanly.

# --- navigation ----------------------------------------------------------
alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias '~'='cd ~'

# --- git ----------------------------------------------------------------
# `gs` and `gpl` are exactly the original definitions, not the -sb / --rebase
# variants a fresh install would normally get.
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --oneline --graph --decorate -20'
alias gd='git diff'
alias gds='git diff --staged'
alias gb='git branch'
alias gco='git checkout'
alias gsw='git switch'
alias gst='git stash'
alias gstp='git stash pop'

# --- safety -------------------------------------------------------------
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'
alias mkdir='mkdir -pv'

# --- quick edit / view --------------------------------------------------
# nano first, exactly as the original; fall back only where nano is absent.
if command -v nano >/dev/null 2>&1; then
  alias editz='nano ~/.zshrc'
else
  alias editz='${EDITOR:-vi} ~/.zshrc'
fi
alias sourcez='source ~/.zshrc'
alias v='${EDITOR:-vim}'
alias vim='nvim 2>/dev/null || vim'

# --- shell --------------------------------------------------------------
alias reload='source ~/.zshrc'
alias path='echo $PATH | tr ":" "\n" | nl'

# --- history ------------------------------------------------------------
alias history='history -i'
alias h='history'
alias hg='history | grep'
alias hgi='history | grep -i'

# --- system -------------------------------------------------------------
alias uptime='uptime -p'
alias whoami='whoami'
alias id='id'
alias cls='clear'
alias kill9='kill -9'
alias killall='killall'
alias shutdown='sudo shutdown now'
alias psg='ps aux | grep'

# --- network ------------------------------------------------------------
alias myip='curl -s ifconfig.me'
alias localip='ip -br addr show | grep -v "^lo"'
alias ping='ping -c 5'
alias fastping='ping -c 10 -s 1'
alias listening='ss -tlnp 2>/dev/null || netstat -an | grep LISTEN'

# --- file size ----------------------------------------------------------
alias sizes='du -sh * | sort -rh | head -20'
alias biggest='du -sh * 2>/dev/null | sort -rh | head -10'
alias largest='du -sh * 2>/dev/null | sort -rh | head -10'
alias findbig='find / -type f -size +100M 2>/dev/null | head -20'

# --- archive ------------------------------------------------------------
alias untar='tar -xvf'
alias unzip='unzip -o'

# --- docker -------------------------------------------------------------
if command -v docker >/dev/null 2>&1; then
  alias dps='docker ps'
  alias dpa='docker ps -a'
  alias di='docker images'
  alias dex='docker exec -it'
  alias dlogs='docker logs -f'
  alias dprune='docker system prune -af'
fi

# --- mew dashboard ------------------------------------------------------
if command -v mew >/dev/null 2>&1; then
  alias mf='mew --full'
  alias ms='mew'
fi

# --- make and cd --------------------------------------------------------
# The original was `alias mkdirp='mkdir -p && cd'`, which created nothing and
# cd'd into whatever you passed. Same name, working implementation.
# `command mkdir` avoids the `mkdir -pv` alias above.
mkdirp() { command mkdir -p -- "$@" && cd -- "$@" ; }
