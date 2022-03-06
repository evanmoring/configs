# Setup fzf
# ---------
if [[ ! "$PATH" == */home/$USERNAME/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/$USERNAME/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/$USERNAME/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/$USERNAME/.fzf/shell/key-bindings.bash"
