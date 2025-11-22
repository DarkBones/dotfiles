# Enable Powerlevel10k instant prompt. Should stay close to the top
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZDOTDIR="$PWD/zsh/.zsh" # TODO: Change to "$HOME/.zsh"
source "$ZDOTDIR/main.zsh"

# To customize prompt, run `p10k configure` or edit dotfiles/zsh/.zsh/.p10k.zsh.
[[ ! -f ~/Developer/new_dotfiles/dotfiles/zsh/.zsh/.p10k.zsh ]] || source ~/Developer/new_dotfiles/dotfiles/zsh/.zsh/.p10k.zsh
