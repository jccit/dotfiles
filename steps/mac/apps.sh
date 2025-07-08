#!/usr/bin/env bash
echo ''
echo '-----------------------------'
echo '    Installing macOS apps    '
echo '-----------------------------'
echo ''

apps=''

if [[ ! -d /Applications/Stats.app ]]; then
    apps+='stats '
fi

if [[ ! -d /Applications/Obsidian.app ]]; then
    apps+='obsidian '
fi

if [[ ! -d /Applications/Ghostty.app ]]; then
    apps+='ghostty '
fi

if [[ -n $apps ]]; then
    echo 'Apps to install:' $apps
    brew install $apps
else
    echo 'All apps already installed'
fi
