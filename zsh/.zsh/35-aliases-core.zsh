[[ -o interactive ]] || return

alias vim='nvim'
alias v='nvim'

# TODO: Implement
# alias cd='z'
# alias cdi='zi'

if command -v eza > /dev/null 2>&1; then
  alias ls='eza'
  alias ll='eza -l'
  alias la='eza -la'
  alias tree='eza -Tl'
fi

if command -v bat > /dev/null 2>&1; then
  alias cat='bat'
fi
