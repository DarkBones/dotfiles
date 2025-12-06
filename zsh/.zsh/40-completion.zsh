[[ -o interactive ]] || return

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

# Ensure the complist module (and menuselect keymap) are loaded
zmodload -i zsh/complist

# Vim-style navigation in completion menus
bindkey -M menuselect 'h' backward-char
bindkey -M menuselect 'j' down-line-or-history
bindkey -M menuselect 'k' up-line-or-history
bindkey -M menuselect 'l' forward-char

# Fzf
if command -v fzf >/dev/null 2>&1; then
  # Choose between fzf-tmux and fzf
  __fzf_cmd() {
    if [[ -n "${TMUX_PANE-}" ]] && command -v fzf-tmux >/dev/null 2>&1; then
      echo "fzf-tmux -d ${FZF_TMUX_HEIGHT:-40%} --"
    else
      echo "fzf"
    fi
  }

  # Core file selector used by the widget
  __fzf_select_files() {
    setopt localoptions pipefail no_aliases 2>/dev/null

    # Prefer fd if available, fall back to find
    local list_cmd
    if command -v fd >/dev/null 2>&1; then
      # fd: files + symlinks, including hidden, excluding .git
      list_cmd='fd --type f --type l --hidden --follow --exclude .git .'
    else
      # find: files + symlinks, skip .git
      list_cmd='find . -mindepth 1 \
        -path "*/.git" -prune -o \
        \( -type f -o -type l \) -print'
    fi

    eval "$list_cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --scheme=path ${FZF_DEFAULT_OPTS-}" \
      $(__fzf_cmd) --multi "$@" | while IFS= read -r item; do
        # Quote each selected path so spaces etc. are safe
        printf '%s ' "${(q)item}"
      done

    local ret=$?
    echo
    return $ret
  }

  # --- History widget (Ctrl-R)

  fzf-history-widget() {
    local selected
    selected=$(fc -l 1 \
      | fzf --tac --no-sort \
      | sed 's/^[[:space:]]*[0-9]\+[[:space:]]*//') || return $?

    BUFFER="$selected"
    CURSOR=${#BUFFER}
    zle redisplay
  }
  zle -N fzf-history-widget
  bindkey '^R' fzf-history-widget

  # --- File widget (Ctrl-T)

  fzf-file-widget() {
    local insert
    insert=$(__fzf_select_files) || return $?
    LBUFFER+="$insert"
    zle reset-prompt
  }
  zle -N fzf-file-widget

  for mode in emacs viins vicmd; do
    bindkey -M "$mode" '^T' fzf-file-widget
  done
fi
