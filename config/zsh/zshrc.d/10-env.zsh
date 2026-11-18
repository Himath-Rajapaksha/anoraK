# 10-env.zsh — editor, pager, locale. No tool assumptions.

if command -v nvim >/dev/null 2>&1; then
  export EDITOR=nvim VISUAL=nvim
elif command -v vim >/dev/null 2>&1; then
  export EDITOR=vim VISUAL=vim
else
  export EDITOR=vi VISUAL=vi
fi

export PAGER=less
export LESS='-R -F -i -M'
export MANPAGER='less -R'
export MANWIDTH=100
export LESSHISTFILE=-

# UTF-8 everywhere. Only set if the locale actually exists.
if command -v locale >/dev/null 2>&1; then
  for _loc in en_US.UTF-8 en_US.utf8 C.UTF-8; do
    if locale -a 2>/dev/null | grep -qix "$_loc"; then
      export LANG="$_loc" LC_ALL="$_loc"
      break
    fi
  done
  unset _loc
fi

# Colours for things that respect the env var rather than a flag.
export CLICOLOR=1
export CLICOLOR_FORCE=0

# XDG where it isn't already set.
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# No iTerm/xterm title escape spam when the user is root over ssh.
unsetopt PROMPT_SP 2>/dev/null
