# Setup fzf
# ---------
if [[ ! "$PATH" == */home/krompus/.fzf/bin* ]]; then
  export PATH="$PATH:/home/krompus/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */home/krompus/.fzf/man* && -d "/home/krompus/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/krompus/.fzf/man"
fi

# Auto-completion
# ---------------
# [[ $- == *i* ]] && source "/home/krompus/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/krompus/.fzf/shell/key-bindings.bash"

