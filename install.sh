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

    sudo cp -r ${dir}/libvirt/hooks /etc/libvirt/hooks

    echo ''
    echo '-----------------------------'
    echo '   Dependencies installed    '
    echo '-----------------------------'
    echo ''

    echo ''
    echo '-----------------------------'
    echo '   Installing gnome theme    '
    echo '-----------------------------'
    echo ''

    mkdir ~/pkg
    git clone https://github.com/vinceliuice/Orchis-theme.git ~/pkg/Orchis
    chmod +x ~/pkg/Orchis/install.sh
    ~/pkg/Orchis/install.sh

    git clone https://github.com/vinceliuice/Fluent-icon-theme.git ~/pkg/fluent
    chmod +x ~/pkg/fluent/install.sh
    ~/pkg/fluent/install.sh

    git clone https://github.com/refi64/stylepak.git ~/pkg/stylepak
    chmod +x ~/pkg/stylepak/stylepak
    ~/pkg/stylepak/stylepak install-user Orchis
    ~/pkg/stylepak/stylepak install-user Orchis-dark
    
fi

#
# Same for macOS and Linux
#

if [[ ! -d $HOME/.oh-my-zsh ]]; then
	echo 'oh-my-zsh is not installed. Downloading...'
	git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
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
git config --global user.name "Josef Citrine"
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

    if [[ ! -d /Applications/Alfred\ 3.app ]]; then
        apps+='alfred '
    fi

    if [[ ! -d /Applications/Spotify.app ]]; then
        apps+='spotify '
    fi

    echo 'Apps to install:' $apps
fi
