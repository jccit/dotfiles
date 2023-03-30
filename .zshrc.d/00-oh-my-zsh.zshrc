# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Command auto-correction.
# Let thefuck handle this for now
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  npm
  yarn
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh