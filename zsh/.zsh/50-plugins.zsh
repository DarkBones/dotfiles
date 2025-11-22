_zsh_try_source() {
  [ -f "$1" ] && source "$1"
}

_zsh_try_source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

unset -f _zsh_try_source
