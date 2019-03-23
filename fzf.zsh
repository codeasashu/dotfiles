# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ashutosh/.fzf-vim/bin* ]]; then
  export PATH="$PATH:/home/ashutosh/.fzf-vim/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/ashutosh/.fzf-vim/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/ashutosh/.fzf-vim/shell/key-bindings.zsh"

