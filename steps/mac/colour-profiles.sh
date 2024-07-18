#!/usr/bin/env bash
# Installs or updates ICC colour profiles

OS=$OSTYPE
dir=`pwd`

if [[ "$OSTYPE" != "darwin"* ]]; then
  echo 'This script only works on macOS'
  exit 1
fi

echo '-----------------------------'
echo 'Copying ICC profiles to ~/Library/ColorSync/Profiles'

mkdir -p ~/Library/ColorSync/Profiles
cp -r ${dir}/colour-profiles/* ~/Library/ColorSync/Profiles

echo 'ICC profiles installed'
echo '-----------------------------'
