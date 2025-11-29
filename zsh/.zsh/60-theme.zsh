# Disable Powerlevel10k instant prompt for compatibility with our dynamic loader
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

THEME_DIR="$ZDOTDIR/themes"
THEME_STATE_FILE="${ZDOTDIR:-$HOME}/.current_theme"

# --- Resolve PROMPT_THEME on startup -----------------------------------------

# If PROMPT_THEME isn't set (via env / HM), try state file:
if [[ -z "${PROMPT_THEME:-}" ]] && [[ -f "$THEME_STATE_FILE" ]]; then
  PROMPT_THEME="$(<"$THEME_STATE_FILE")"
fi

# Fallback default
PROMPT_THEME="${PROMPT_THEME:-starship}"

# --- Helpers ------------------------------------------------------------------

load_theme() {
  local theme="$1"
  local theme_file="$THEME_DIR/$theme.zsh"

  # Drop any functions with these prefixes from the hook arrays
  precmd_functions=("${(@)precmd_functions:#powerlevel10k_*}")
  preexec_functions=("${(@)preexec_functions:#powerlevel10k_*}")
  chpwd_functions=("${(@)chpwd_functions:#powerlevel10k_*}")

  precmd_functions=("${(@)precmd_functions:#prompt_pure_*}")
  preexec_functions=("${(@)preexec_functions:#prompt_pure_*}")
  chpwd_functions=("${(@)chpwd_functions:#prompt_pure_*}")

  # Now load the new theme
  if [[ -f "$theme_file" ]]; then
    source "$theme_file"
  else
    echo "⚠️  Theme '$theme' not found in $THEME_DIR" >&2
  fi
}

# TOFIX: Theme doesn't persist on rpi4
persist_theme() {
  local theme="$1"
  print -r -- "$theme" >| "$THEME_STATE_FILE"
}

_theme_fzf_select() {
  local themes

  # Collect available theme names (strip .zsh)
  themes=("${(@f)$(ls "$THEME_DIR" 2>/dev/null | sed 's/\.zsh$//')}")

  if (( ${#themes} == 0 )); then
    echo "⚠️  No themes found in $THEME_DIR" >&2
    return 1
  fi

  if ! command -v fzf >/dev/null 2>&1; then
    echo "Available themes:" >&2
    printf '  %s\n' "${themes[@]}" >&2
    echo "⚠️  fzf not found. Install it or run: theme <name>" >&2
    return 1
  fi

  printf '%s\n' "${themes[@]}" | fzf --prompt="Theme > " --height=40% --reverse
}

# --- Public API ---------------------------------------------------------------

change-theme() {
  local theme="$1"

  # No arg → pick via fzf
  if [[ -z "$theme" ]]; then
    theme="$(_theme_fzf_select)" || return 1
  fi

  PROMPT_THEME="$theme"
  persist_theme "$theme"

  # Load new prompt definitions
  load_theme "$theme"

  # --- Fix multiline prompt duplication ---
  # Only call ZLE functions inside interactive ZLE context
  if [[ -o interactive ]]; then
    # Reset completion/prompt widgets
    autoload -Uz promptinit
    promptinit

    # Force repaint without ghost lines
    if [[ -n "$ZLE" ]]; then
      zle .reset-prompt
      zle -R
    else
      # Not inside a widget (e.g. after Enter)
      # Cleanly redraw prompt
      print -r -- ""
    fi
  fi
}

alias theme="change-theme"

# --- Initial load -------------------------------------------------------------

load_theme "$PROMPT_THEME"
