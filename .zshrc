export ZSH=${HOME}/.oh-my-zsh
ZSH_THEME="gentoo"

case `uname` in
	Darwin)
		plugins=(brew docker docker-compose git)
		;;
	*)
		plugins=(docker docker-compose git)
		;;
esac
source $ZSH/oh-my-zsh.sh


export PATH="${HOME}/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

function collapse_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

PROMPT='%{$fg[green]%}%n@%m %{$fg_bold[blue]%}$(collapse_pwd)%{$reset_color%}$(hg_prompt_info)$(git_prompt_info) %{$fg_bold[blue]%}\$ %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

