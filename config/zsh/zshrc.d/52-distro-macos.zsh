# 52-distro-macos.zsh — macOS via Homebrew
[[ "$(uname -s)" == Darwin ]] || return 0
command -v brew >/dev/null 2>&1 || return 0

alias update='brew update'
alias upgrade='brew upgrade'
alias install='brew install'
alias remove='brew uninstall'
alias autoremove='brew autoremove'
alias autoclean='brew cleanup --prune=all'
alias clean='brew cleanup --prune=all'
alias search='brew search'
alias list='brew list --versions | grep'
alias info='brew info'
alias depends='brew deps --tree'
alias held='brew list --pinned'
alias firewall='sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate'

# The Linux fragment defines this; macOS needs its own.
alias services='brew services list'
