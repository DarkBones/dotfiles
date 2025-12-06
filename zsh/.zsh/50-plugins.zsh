_zsh_try_source() {
  [ -f "$1" ] && source "$1"
}

# Autosuggestions (ghost text from history)
_zsh_try_source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Syntax highlighting (must come near the end)
_zsh_try_source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

unset -f _zsh_try_source
