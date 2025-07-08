#!/usr/bin/env bash
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
