export PATH="/usr/local/bin/:${PATH}"

SAVEHIST=10000

ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)
source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then
	echo "Creating a zgen save..."
	zgen oh-my-zsh
	zgen oh-my-zsh plugins/brew
	zgen oh-my-zsh plugins/docker-compose
	zgen oh-my-zsh plugins/docker
	zgen oh-my-zsh plugins/git
	zgen oh-my-zsh plugins/gradle
	zgen oh-my-zsh plugins/nmap
	zgen oh-my-zsh themes/gentoo
	zgen loadall <<EOPLUGINS
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-completions src
EOPLUGINS
	zgen save
fi


# Custom prompt:
function collapse_pwd {
	echo $(pwd | sed -e "s,^$HOME,~,")
}
PROMPT='%{$fg[green]%}%n@%m %{$fg_bold[blue]%}$(collapse_pwd)%{$reset_color%}$(git_prompt_info) %{$fg_bold[blue]%}\$ %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"
export LSCOLORS=exfxcxdxbxGxDxabagacad

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


