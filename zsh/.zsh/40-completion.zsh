autoload -Uz compinit

# Put any custom completion functions in $ZDOTDIR/completions
fpath=("$ZDOTDIR/completions" $fpath)

# Completion styles
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
                                    'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Use a cache for faster startup
_compdump="${ZDOTDIR:-$HOME}/.zcompdump"
if [[ -f "$_compdump" ]]; then
  compinit -d "$_compdump"
else
  compinit -C -d "$_compdump"
fi
unset _compdump
