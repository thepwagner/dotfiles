# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

FZF_DIR="/usr/local/opt/fzf/shell"
if [ -d "/usr/share/fzf" ]; then
	FZF_DIR="/usr/share/fzf"
fi

[[ $- == *i* ]] && source "${FZF_DIR}/completion.zsh" 2> /dev/null

# Key bindings
# ------------
[ -f "${FZF_DIR}/key-bindings.zsh" ] && source "${FZF_DIR}/key-bindings.zsh"

