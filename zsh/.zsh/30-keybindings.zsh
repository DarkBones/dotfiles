# Only apply keybindings in interactive shells
[[ -o interactive ]] || return

# Enable vi-style editing
bindkey -v

ARROW_UP='^[[A'
ARROW_DOWN='^[[B'
DELETE_KEY='^[[3~'

# Always start in INSERT mode
function zle-line-init {
  zle -K viins
}
zle -N zle-line-init

# Load and register prefix-search widgets
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

for mode in viins vicmd; do
  bindkey -M "$mode" "$DELETE_KEY" delete-char
done

# Insert-mode history with prefix search
bindkey -M viins "$ARROW_UP"    up-line-or-beginning-search
bindkey -M viins "$ARROW_DOWN"  down-line-or-beginning-search
bindkey -M viins '^P'           up-line-or-beginning-search
bindkey -M viins '^N'           down-line-or-beginning-search

# Command-mode "dumb" history
bindkey -M vicmd '^P'           up-history
bindkey -M vicmd '^N'           down-history
bindkey -M vicmd "$ARROW_UP"    up-history
bindkey -M vicmd "$ARROW_DOWN"  down-history

unset ARROW_UP ARROW_DOWN DELETE_KEY
