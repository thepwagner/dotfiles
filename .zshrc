export ZSH=${HOME}/.oh-my-zsh
ZSH_THEME="gentoo"

case `uname` in
	Darwin)
		plugins=(brew docker docker-compose git)
		export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home
		export ANDROID_HOME=/usr/local/opt/android-sdk
		;;
	*)
		plugins=(docker docker-compose git)
		;;
esac

DISABLE_AUTO_UPDATE="true"
source $ZSH/oh-my-zsh.sh


export PATH="${HOME}/bin:${HOME}/go/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

function collapse_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

PROMPT='%{$fg[green]%}%n@%m %{$fg_bold[blue]%}$(collapse_pwd)%{$reset_color%}$(hg_prompt_info)$(git_prompt_info) %{$fg_bold[blue]%}\$ %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

if which docker-machine >/dev/null 2>&1; then
	eval $(docker-machine env docker-vm)
fi

export EDITOR=/usr/bin/vim
export GOPATH=${HOME}/go

eval "$(rbenv init -)"

