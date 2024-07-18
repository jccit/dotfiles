if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.zshrc.d/theme.omp.json)"
fi

eval "$(atuin init zsh)"
