export PATH="/usr/local/bin:/usr/local/sbin:${PATH}:${HOME}/bin:${HOME}/go/bin"
export DOCKER_SCAN_SUGGEST=false

SAVEHIST=10000
PROMPT='%n@%m %~ $ '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"
export LSCOLORS=exfxcxdxbxGxDxabagacad

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias vi=/usr/bin/vim

export EDITOR=/usr/bin/vim
export LC_CTYPE=en_CA.utf-8

export GOPATH=~/go

[[ -f ${HOME}/.zprofile ]] && source ${HOME}/.zprofile

bindkey "[D" backward-word
bindkey "[C" forward-word
