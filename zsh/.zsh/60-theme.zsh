# Default theme if none specified
PROMPT_THEME="${PROMPT_THEME:-p10k}"

THEME_DIR="$ZDOTDIR/themes"

# Load a theme file
load_theme() {
  local theme="$1"
  local theme_file="$THEME_DIR/$theme.zsh"

  if [[ -f "$theme_file" ]]; then
    source "$theme_file"
  else
    echo "⚠️  Theme '$theme' not found in $THEME_DIR"
  fi
}

# Load the current theme at startup
load_theme "$PROMPT_THEME"

# Switch theme at runtime
change-theme() {
  if [[ -z "$1" ]]; then
    echo "Usage: change-theme <theme>"
    echo "Available themes:"
    ls "$THEME_DIR" | sed 's/\.zsh$//'
    return 1
  fi

  PROMPT_THEME="$1"
  load_theme "$1"
  zle reset-prompt 2>/dev/null
}

# Alias for convenience
alias theme="change-theme"
