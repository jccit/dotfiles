
#!/usr/bin/env bash

set -e

echo 'Adjusting macOS...'


## Finder stuff
defaults write NSGlobalDomain AppleShowAllExtensions -bool true  # show extensions
defaults write com.apple.finder _FXSortFoldersFirst -bool true   # folders first
defaults write com.apple.finder ShowPathbar -bool true           # show path bar
defaults write com.apple.finder AppleShowAllFiles YES            # show hidden files
defaults write com.apple.finder QLEnableTextSelection -bool true # text selection in quick look


# Kill apps
echo 'Updated settings, killing apps'
killall Finder
killall Dock
echo 'Apps restarted. Settings applied'
