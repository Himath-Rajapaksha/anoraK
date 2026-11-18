# 56-macos-system.zsh — macOS-only helpers
[[ "$(uname -s)" == Darwin ]] || return 0

alias showfiles='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
alias flushdns='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
alias battery='pmset -g batt'
alias caffeinate='caffeinate -dimsu &'
alias sleepnow='pmset sleepnow'
alias lsregister='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister'
alias xcode='sudo xcode-select -s /Applications/Xcode.app/Contents/Developer'
alias clt='xcode-select --install'

# Port -> pid -> what is holding it (lsof is the macOS way)
port() {
  [[ -n "$1" ]] || { print -u2 "usage: port <number>"; return 1; }
  lsof -nP -iTCP:"$1" -sTCP:LISTEN
}
