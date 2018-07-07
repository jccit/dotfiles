# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="gallois"

# Command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  npm
)

source $ZSH/oh-my-zsh.sh