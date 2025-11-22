typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

if [[ -n "${ZDOTDIR:-}" && ! -f "$ZDOTDIR/main.zsh" ]]; then
  unset ZDOTDIR
fi

export ZDOTDIR="${ZDOTDIR:-$HOME/.zsh}"

source "$ZDOTDIR/main.zsh"

[[ -f "$ZDOTDIR/.p10k.zsh" ]] && source "$ZDOTDIR/.p10k.zsh"
