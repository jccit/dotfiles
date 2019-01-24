eval $(thefuck --alias)

alias gs="git status"
alias gd="git status"
alias gall="git add ."
alias gc="git commit"

alias cls="ls -l | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"
alias csh="source ~/.zshrc"
alias zshrc="vim ~/.zshrc"
alias cl="clear"

alias kube="kubectl"