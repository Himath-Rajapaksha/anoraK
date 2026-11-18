# 45-aliases-modern.zsh — each alias exists ONLY if its binary does.
# This is what stops a fresh Fedora or macOS box from exploding.

if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons --group-directories-first'
  alias ll='eza -la --icons --git'
  alias la='eza -a --icons --group-directories-first'
  alias lt='eza -T --icons --git-ignore'
  alias l='eza -lah --icons --git'
elif [[ "$(uname -s)" == Darwin ]]; then
  alias ls='ls -G'
  alias ll='ls -lahG'
else
  alias ls='ls --color=auto'
  alias ll='ls -lah --color=auto'
fi

command -v bat >/dev/null 2>&1 || command -v batcat >/dev/null 2>&1 \
  && alias cat='bat --paging=never'

command -v dust >/dev/null 2>&1  && alias dust='dust -r'
command -v duf  >/dev/null 2>&1  && alias duf='duf'
command -v delta >/dev/null 2>&1 && alias diff='delta'
command -v procs >/dev/null 2>&1 && alias ps='procs --colorful'
command -v btop  >/dev/null 2>&1 && alias top='btop'
command -v hyperfine >/dev/null 2>&1 && alias hyper='hyperfine --warmup 3'
command -v tldr >/dev/null 2>&1 && alias tldr='tldr --color=always'
command -v broot >/dev/null 2>&1 && alias tree='broot -c'
command -v nvim >/dev/null 2>&1 && alias vim='nvim'

# ripgrep as grep. Sharp edge: rg is not grep — flags differ.
# Undo with: unalias grep   (or use \grep for the real one)
if command -v rg >/dev/null 2>&1; then
  alias rg='rg --smart-case'
fi

# file sizes / disk, tool-agnostic fallbacks
alias sizes='du -sh * 2>/dev/null | sort -rh | head -20'
alias biggest='du -sh * 2>/dev/null | sort -rh | head -10'
alias meminfo='free -h 2>/dev/null || vm_stat'
alias diskinfo='lsblk -f 2>/dev/null || df -h'
alias cpuinfo='lscpu 2>/dev/null | head -20 || sysctl -n machdep.cpu.brand_string'
alias ports='ss -tulpn 2>/dev/null || lsof -iTCP -sTCP:LISTEN -n -P'
