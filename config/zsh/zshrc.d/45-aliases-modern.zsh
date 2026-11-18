# 45-aliases-modern.zsh — aliases that need an external binary.
# Each one exists ONLY if its binary does, so a bare Fedora or macOS box
# sources this file without a single error.

# --- eza / ls ------------------------------------------------------------
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons --group-directories-first'
  alias ll='eza -la --icons --git'
  alias la='eza -a --icons --group-directories-first'
  alias lt='eza -T --icons --git-ignore'
  # These two came after the ls aliases in the original, so they expand
  # through `ls` exactly as they did there.
  alias l='ls -lah'
  alias l.='ls -d .*'
elif [[ "$(uname -s)" == Darwin ]]; then
  alias ls='ls -G'
  alias ll='ls -lahG'
  alias l='ls -lah'
  alias l.='ls -d .*'
else
  alias ls='ls --color=auto'
  alias ll='ls -lah --color=auto'
  alias l='ls -lah'
  alias l.='ls -d .*'
fi

# --- modern tools --------------------------------------------------------
command -v bat >/dev/null 2>&1 || command -v batcat >/dev/null 2>&1 \
  && alias cat='bat --paging=never'


# The original aliased du/df twice; the second pair won, so the live shell had
# du='du -sh' and df='df -h'. That is what these are. dust/duf keep their own
# names, which is the only difference from the dead first pair.
alias du='du -sh'
alias df='df -h'

command -v delta >/dev/null 2>&1 && alias diff='delta'
command -v procs >/dev/null 2>&1 && alias procs='procs --colorful'
command -v btop  >/dev/null 2>&1 && alias top='btop'
command -v hyperfine >/dev/null 2>&1 && alias hyper='hyperfine --warmup 3'
command -v tldr >/dev/null 2>&1 && alias tldr='tldr --color=always'

# `vim` is defined in 40-aliases.zsh with the original nvim-then-vim fallback,
# so it is deliberately not redefined here.

# grep -> ripgrep, exactly as the original had it. Use \grep for the real one.
command -v rg >/dev/null 2>&1 && alias grep='rg'

# --- info ----------------------------------------------------------------
# Same aliases as the original; the fallback after || is what makes them work
# on macOS, where free/lsblk/lscpu/ss do not exist.
alias meminfo='free -h 2>/dev/null || vm_stat'
alias diskinfo='lsblk -f 2>/dev/null || df -h'
alias cpuinfo='lscpu 2>/dev/null | head -20 || sysctl -n machdep.cpu.brand_string'
alias ports='ss -tulpn 2>/dev/null || lsof -iTCP -sTCP:LISTEN -n -P'
