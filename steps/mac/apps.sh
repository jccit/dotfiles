#!/usr/bin/env bash
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