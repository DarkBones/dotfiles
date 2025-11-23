export MANWIDTH=${MANWIDTH:-80}

# Start tmuxifier session
function s() {
  [ -z $1 ] && {
    echo "usage: s [tmuxifier-session-name]" >&2
    echo "example:" >&2
    echo "s dotfiles" >&2
    return 1
  }

  tmuxifier s "$1"
}
