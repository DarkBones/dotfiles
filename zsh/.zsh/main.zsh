# Fail fast
set -o pipefail

# Load modules in order
for rc in \
  "$ZDOTDIR/.zsh/00-options.zsh" \
  "$ZDOTDIR/.zsh/10-path.zsh" \
  "$ZDOTDIR/.zsh/20-env.zsh" \
  "$ZDOTDIR/.zsh/30-keybindings.zsh" \
  "$ZDOTDIR/.zsh/40-completion.zsh" \
  "$ZDOTDIR/.zsh/50-plugins.zsh" \
  "$ZDOTDIR/.zsh/60-theme.zsh" \
  "$ZDOTDIR/.zsh/90-local.zsh"
do
  [ -f "$rc" ] && source "$rc"
done
