# 40-aliases.zsh — universal. No external binaries required.

# --- navigation ----------------------------------------------------------
alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias md='mkdir -p'

# --- git ----------------------------------------------------------------
alias gs='git status -sb'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gca='git commit --amend --no-edit'
alias gp='git push'
alias gpl='git pull --rebase'
alias gl='git log --oneline --graph --decorate -20'
alias gd='git diff'
alias gds='git diff --staged'
alias gb='git branch'
alias gco='git checkout'
alias gsw='git switch'
alias gst='git stash'
alias gstp='git stash pop'
alias gclean='git clean -nd'

# --- safety -------------------------------------------------------------
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'

# --- archive ------------------------------------------------------------
alias untar='tar -xvf'
alias targz='tar -czvf'
alias unzip='unzip -o'

# --- shell --------------------------------------------------------------
alias reload='exec zsh -l'
alias sourcez='source ~/.zshrc'
alias editz='${EDITOR:-vi} ~/.zshrc'
alias path='print -l ${(s.:.)PATH} | nl'

# --- history ------------------------------------------------------------
alias h='history -i 1'
alias hg='history -i 1 | grep'
alias hgi='history -i 1 | grep -i'

# --- network ------------------------------------------------------------
alias myip='curl -s --max-time 4 https://ifconfig.me && echo'
alias listening='ss -tlnp 2>/dev/null || netstat -an | grep LISTEN'
alias ping='ping -c 5'

# --- extraction by extension -------------------------------------------
extract() {
  [[ -f "$1" ]] || { print -u2 "not a file: $1"; return 1; }
  case "${1:l}" in
    *.tar.bz2|*.tbz2) tar -xjvf "$1" ;;
    *.tar.gz|*.tgz)   tar -xzvf "$1" ;;
    *.tar.xz|*.txz)   tar -xJvf "$1" ;;
    *.tar)            tar -xvf  "$1" ;;
    *.bz2)            bunzip2   "$1" ;;
    *.gz)             gunzip    "$1" ;;
    *.rar)            unrar x   "$1" ;;
    *.7z)             7z x      "$1" ;;
    *.zip)            unzip -o  "$1" ;;
    *.zst)            unzstd    "$1" ;;
    *) print -u2 "unknown archive: $1"; return 1 ;;
  esac
}

# mkdir then cd
mkcd() { mkdir -p -- "$1" && cd -- "$1"; }
