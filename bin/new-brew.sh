#!/bin/bash

# Install brew
if [ ! -f /usr/local/bin/brew ]; then
	sudo xcodebuild -license
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

# Shell
brew install fzf
brew cask install iterm2
brew install jq
brew install tmux
brew install watch
brew install zsh

# Utils
brew cask install docker
brew install git
brew cask install google-chrome
brew cask install google-drive
brew install htop-osx
brew install macvim
brew install openssh
brew install pass
brew cask install sublime-text

# Cloud
brew install awscli
brew install terraform

# Python
brew install python
brew install python3

# Node
brew install node@6

# Java
brew install gradle
brew cask install intellij-idea
brew cask install java
brew cask install jd-gui
brew cask install visualvm

# Vagrant
brew cask install vagrant
brew cask install virtualbox

# Networking
brew cask install viscosity

# Lulz
brew cask install slack
brew cask install spotify
brew cask install vlc

