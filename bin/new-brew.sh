#!/bin/bash

# Install brew
if [ ! -f /usr/local/bin/brew ]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

# Shell
brew install fzf
brew install jq
brew install tmux
brew install watch
brew install zsh

# Utils
brew install awscli
brew install Caskroom/cask/docker
brew install git
brew install Caskroom/cask/google-chrome
brew install htop-osx
brew install macvim
brew install openssh
brew install pass
brew install Caskroom/cask/sublime-text
brew install terraform

# Python
brew install python
brew install python3

# Node
brew install node@6

# Java
brew install Caskroom/cask/java
brew install Caskroom/cask/jd-gui
brew install gradle
brew install Caskroom/cask/visualvm

# Vagrant
brew install Caskroom/cask/vagrant
brew install Caskroom/cask/virtualbox

# Networking
brew install Caskroom/cask/viscosity

