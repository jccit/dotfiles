#!/usr/bin/env bash
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
    brew install zsh
fi

if command -v oh-my-posh >/dev/null 2>&1; then
    echo 'oh-my-posh already installed'
else
    echo 'Installing terminal utils...'
    brew install oh-my-posh atuin lsd 
fi

echo ''
echo '-----------------------------'
echo '   Dependencies installed    '
echo '-----------------------------'
echo ''