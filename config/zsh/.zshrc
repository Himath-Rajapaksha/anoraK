# ==========================================================================
#  anoraK — portable zsh entrypoint
#  Every fragment below is safe on a machine where its tools are missing.
#  Nothing in this file assumes Debian, or this user.
# ==========================================================================

# Resolve this file's real directory, following symlinks. Works whether
# ~/.zshrc is a symlink into the repo or a straight copy.
typeset -g ANORAK_ZSH_DIR="${${(%):-%x}:A:h}"

# --- history -------------------------------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS HIST_VERIFY \
       SHARE_HISTORY APPEND_HISTORY INC_APPEND_HISTORY \
       EXTENDED_HISTORY AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS \
       INTERACTIVE_COMMENTS NO_BEEP

# --- keybindings ---------------------------------------------------------
bindkey -e
# forward/back word
bindkey '^[[1;5C' forward-word 2>/dev/null
bindkey '^[[1;5D' backward-word 2>/dev/null
# Home / End
bindkey '^[[H' beginning-of-line 2>/dev/null
bindkey '^[[F' end-of-line 2>/dev/null

# --- load fragments in lexical order -------------------------------------
# 00-omz, 10-env, 20-paths, 30-tools, 40-aliases, 45-aliases-modern,
# 50-distro-*, 90-local
if [[ -d "$ANORAK_ZSH_DIR/zshrc.d" ]]; then
  for _f in "$ANORAK_ZSH_DIR"/zshrc.d/*.zsh(N); do
    source "$_f"
  done
  unset _f
fi

unset ANORAK_ZSH_DIR
