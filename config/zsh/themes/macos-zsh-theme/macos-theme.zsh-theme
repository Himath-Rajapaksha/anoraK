# macos-zsh-theme — made portable.
# Original used `last -1 -R $USER` (BSD/GNU flag mismatch) and `export PS1`
# (a bash idiom that does nothing in zsh). Both fixed below.

# Last-login banner, only where `last` behaves and only in a real terminal.
if [[ -o interactive && -t 1 ]] && command -v last >/dev/null 2>&1; then
  typeset -g _mt_last
  _mt_last="$(last -1 "$USER" 2>/dev/null \
    | awk 'NR==1 && $4!="" {print $4, $5, $6, $7; exit}')"
  [[ -n "$_mt_last" ]] && print -P "%F{240}Last login: ${_mt_last}%f"
  unset _mt_last
fi

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

git_prompt() {
  local info
  info="$(git_prompt_info 2>/dev/null)"
  [[ -n "$info" ]] && print -rn -- "$info"
}

PROMPT='%F{green}%n%f@%F{cyan}%m%f %F{blue}%1~%f %# '
RPROMPT='$(git_prompt)'
