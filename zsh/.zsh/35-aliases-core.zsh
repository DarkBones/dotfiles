[[ -o interactive ]] || return

alias vim='nvim'
alias v='nvim'

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
  alias cd='z'
  alias cdi='zi'
fi

if command -v eza > /dev/null 2>&1; then
  alias ls='eza'
  alias ll='eza -l'
  alias la='eza -la'
  alias tree='eza -Tl'
fi

if command -v bat > /dev/null 2>&1; then
  alias cat='bat'
fi
