#!/usr/bin/env bash

dir=`pwd`

OS=$OSTYPE

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS=$( awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }' )
fi

# macOS cli deps
if [[ "$OS" == "darwin"* ]]; then
    echo '-----------------------------'
    echo 'Installing macOS dependencies'
    echo '-----------------------------'
    echo ''

    if command -v brew >/dev/null 2>&1; then
        echo 'Homebrew already installed'
    else
        echo 'Installing homebrew...'
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    if [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; then
        echo 'Installing XCode tools (you may be prompted to enter your password)...'
    else
        echo 'XCode tools already installed'
    fi

    if command -v zsh >/dev/null 2>&1; then
        echo 'ZSH already installed'
    else
        echo 'Installing ZSH...'
        brew install git zsh
    fi

    if command -v node >/dev/null 2>&1; then
        echo 'Node already installed'
    else
        echo 'Installing Node...'
        brew install node
    fi

    if command -v yarn >/dev/null 2>&1; then
        echo 'Yarn already installed'
    else
        echo 'Installing Yarn...'
        brew install yarn
    fi

    if command -v thefuck >/dev/null 2>&1; then
        echo 'thef*** already installed'
    else
        echo 'Installing thef***...'
        brew install thefuck
    fi

    echo ''
    echo '-----------------------------'
    echo '   Dependencies installed    '
    echo '-----------------------------'
    echo ''
elif [[ "$OS" == "arch"* ]]; then
    echo '-----------------------------'
    echo ' Installing arch linux deps'
    echo '-----------------------------'
    echo ''

    sudo pacman -S nodejs yarn zsh thefuck

    echo ''
    echo '-----------------------------'
    echo '   Dependencies installed    '
    echo '-----------------------------'
    echo ''
fi

#
# Same for macOS and Linux
#

if [[ ! -d $HOME/.oh-my-zsh ]]; then
	echo 'oh-my-zsh is not installed. Downloading...'
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

if [[ ! -d $HOME/.zshrc.d ]]; then
    echo 'No zshrc.d folder. Replacing config with base'
    cp ${dir}/.zshrc ${HOME}/.zshrc
    cp -R ${dir}/.zshrc.d ${HOME}/.zshrc.d
fi

# Install macOS apps
if [[ "$OS" == "darwin"* ]]; then
    echo ''
    echo '-----------------------------'
    echo '    Installing macOS apps    '
    echo '-----------------------------'
    echo ''

    apps=''

    if [[ ! -d /Applications/Visual\ Studio\ Code.app ]]; then
        apps+='visual-studio-code '
    fi

    if [[ ! -d /Applications/Firefox.app ]]; then
        apps+='firefox '
    fi

    if [[ ! -d /Applications/1Password\ 7.app ]]; then
        apps+='1password '
    fi

    if [[ ! -d /Applications/Alfred\ 3.app ]]; then
        apps+='alfred '
    fi

    if [[ ! -d /Applications/Spotify.app ]]; then
        apps+='spotify '
    fi

    echo 'Apps to install:' $apps
fi
