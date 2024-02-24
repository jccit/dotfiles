#!/usr/bin/env bash
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