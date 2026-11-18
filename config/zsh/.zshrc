# ==========================================================================
#  anoraK — portable zsh entrypoint
#
#  This file replaces ~/.zshrc line-for-line in intent: it sets the oh-my-zsh
#  location and plugin list, then loads the user configuration. The original
#  ~/.zshrc's own options are kept in the fragments, not here.
# ==========================================================================

# Resolve this file's real directory, following symlinks. Works whether
# ~/.zshrc is a symlink into the repo or a straight copy.
typeset -g ANORAK_ZSH_DIR="${${(%):-%x}:A:h}"

# Load fragments in lexical order. 00-omz must run first: it starts
# oh-my-zsh, and everything after it needs the plugins loaded.
if [[ -d "$ANORAK_ZSH_DIR/zshrc.d" ]]; then
  for _f in "$ANORAK_ZSH_DIR"/zshrc.d/*.zsh(N); do
    source "$_f"
  done
  unset _f
fi

unset ANORAK_ZSH_DIR
