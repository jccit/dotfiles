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
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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

    echo ''
    echo '-----------------------------'
    echo '   Dependencies installed    '
    echo '-----------------------------'
    echo ''

    # Apply macOS settings
    source mac-tweaks.sh
elif [[ "$OS" == "arch"* ]]; then
    echo '-----------------------------'
    echo ' Installing arch linux deps'
    echo '-----------------------------'
    echo ''

    sudo pacman -S nodejs yarn zsh bottom glances duf bat lsd tmux libvirt qemu swtpm spice-protocol gnome-themes-extra gtk-engine-murrine

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
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

if [[ ! -d $HOME/.starship ]]; then
    echo 'Installing starship'
    mkdir -p $HOME/.starship
    curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir $HOME/.starship -f
    ln -s ${dir}/starship.toml ${HOME}/.starship/starship.toml
fi

if [[ ! -d $HOME/.oh-my-zsh/plugins/zsh-autosuggestions ]]; then
    echo 'Installing zsh-autosuggestions'
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/plugins/zsh-autosuggestions
fi

if [[ ! -d $HOME/.zshrc.d ]]; then
    echo 'No zshrc.d folder. Replacing config with base'
    cp ${dir}/.zshrc ${HOME}/.zshrc
    ln -s ${dir}/.zshrc.d ${HOME}/.zshrc.d
fi


if [[ ! -d $HOME/.nvm ]]; then
    echo 'nvm is not installed. Downloading...'
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
fi

# Set github config
git config --global user.name "Joe Citrine"
git config --global user.email "josef@citrine.dev"

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

    if [[ -n $apps ]]; then
        echo 'Apps to install:' $apps
        brew install $apps
    else
        echo 'All apps already installed'
    fi

    bash install-colour-profiles.sh
fi
