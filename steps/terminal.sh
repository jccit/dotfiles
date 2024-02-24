#!/usr/bin/env bash
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