# Enable Powerlevel10k instant prompt. Should stay close to the top
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Point to the actual config dir (symlink created by Snowman)
export ZDOTDIR="${ZDOTDIR:-$HOME/.zsh}"

source "$ZDOTDIR/main.zsh"

# To customize prompt, run `p10k configure` or edit $ZDOTDIR/.p10k.zsh.
[[ -f "$ZDOTDIR/.p10k.zsh" ]] && source "$ZDOTDIR/.p10k.zsh"
