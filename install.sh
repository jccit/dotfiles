#!/usr/bin/env bash

dir=`pwd`

OS=$OSTYPE

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS=$( awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }' )
fi

if [[ "$OS" == "darwin"* ]]; then
    # macOS specific steps
    source steps/mac/dependencies.sh
    source steps/mac/tweaks.sh
    source steps/mac/colour-profiles.sh
elif [[ "$OS" == "arch"* ]]; then
    # Arch Linux specific steps
    source steps/linux/dependencies.sh
fi

# Setup CLI tools on both macOS and Linux
source steps/terminal.sh

# Install macOS apps
if [[ "$OS" == "darwin"* ]]; then
    source steps/mac/apps.sh
fi
