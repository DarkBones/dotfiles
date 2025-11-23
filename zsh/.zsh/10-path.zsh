# Base user bin dirs
path_add_front() {
  [ -d "$1" ] || return 0
  case ":$PATH:" in
    *":$1:"*) : ;;
    *) PATH="$1:$PATH" ;;
  esac
}

path_add_back() {
  [ -d "$1" ] || return 0
  case ":$PATH:" in
    *":$1:"*) : ;;
    *) PATH="$PATH:$1" ;;
  esac
}

# Put common dirs at the front
path_add_front "$HOME/.local/bin"
path_add_front "$HOME/bin"
path_add_back "$HOME/.tmuxifier/bin"

export PATH
unset -f path_add_front path_add_back
