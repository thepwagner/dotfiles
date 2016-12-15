#!/bin/bash

if [ ! -f /usr/local/bin/brew ]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

# Shell
brew install fzf
brew install jq
brew install tmux
brew install zsh

# Utils
brew install awscli
brew install Caskroom/cask/docker
brew install git
brew install Caskroom/cask/google-chrome
brew install htop-osx
brew install macvim
brew install homebrew/dupes/openssh
brew install Caskroom/cask/sublime-text

# Python
brew install python
brew install python3

# Node
brew install node@6

# Java
brew install Caskroom/cask/java
brew install gradle
brew install Caskroom/cask/visualvm

# Vagrant
brew install Caskroom/cask/vagrant
brew install Caskroom/cask/virtualbox

# Networking
brew install Caskroom/cask/viscosity

