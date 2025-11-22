typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Comment out the preamble for now
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export ZDOTDIR="${ZDOTDIR:-$HOME/.zsh}"
source "$ZDOTDIR/main.zsh"

[[ -f "$ZDOTDIR/.p10k.zsh" ]] && source "$ZDOTDIR/.p10k.zsh"
