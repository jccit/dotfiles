
#!/usr/bin/env bash

set -e

echo 'Adjusting macOS...'


## Finder stuff
defaults write NSGlobalDomain AppleShowAllExtensions -bool true  # show extensions
defaults write com.apple.finder _FXSortFoldersFirst -bool true   # folders first
defaults write com.apple.finder ShowPathbar -bool true           # show path bar
defaults write com.apple.finder AppleShowAllFiles YES            # show hidden files
defaults write com.apple.finder QLEnableTextSelection -bool true # text selection in quick look

## System stuff
defaults write com.apple.menuextra.battery ShowPercent -string "YES" # show battery percent

## Dock stuff
defaults write com.apple.dock orientation -string "left"  # pin dock to left side
defaults write com.apple.dock autohide -bool true         # hide the dock automatically
defaults write com.apple.dock autohide-delay -float 0     # no delay when showing dock


# Kill apps
echo 'Updated settings, killing apps'
killall Finder
killall Dock
echo 'Apps restarted. Settings applied'
