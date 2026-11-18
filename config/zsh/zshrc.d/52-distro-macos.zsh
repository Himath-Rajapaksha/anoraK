# 52-distro-macos.zsh — macOS via Homebrew
[[ "$(uname -s)" == Darwin ]] || return 0
command -v brew >/dev/null 2>&1 || return 0

alias update='brew update'
alias upgrade='brew upgrade'
alias full-upgrade='brew upgrade --greedy'
alias install='brew install'
alias remove='brew uninstall'
alias purge='brew uninstall --zap'
alias autoremove='brew autoremove'
alias autoclean='brew cleanup --prune=all'
alias aptclean='brew cleanup --prune=all'
alias search='brew search'
alias pkgs='brew list --versions'
alias info='brew info'
alias depends='brew deps --tree'
alias held='brew list --pinned'
alias policy='brew outdated --verbose'
alias doctor='brew doctor'
alias services='brew services list'
alias firewall='sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate'

# Is this Mac Intel or Apple Silicon? Determines Homebrew prefix.
alias arch='uname -m'
