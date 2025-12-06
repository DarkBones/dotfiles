# Fail fast
set -o pipefail

# Load modules in order
for rc in \
  "$ZDOTDIR/00-options.zsh" \
  "$ZDOTDIR/10-path.zsh" \
  "$ZDOTDIR/20-env.zsh" \
  "$ZDOTDIR/30-keybindings.zsh" \
  "$ZDOTDIR/35-aliases-core.zsh" \
  "$ZDOTDIR/40-completion.zsh" \
  "$ZDOTDIR/50-plugins.zsh" \
  "$ZDOTDIR/60-theme.zsh" \
  "$ZDOTDIR/70-login.zsh" \
  "$ZDOTDIR/80-roles.zsh" \
  "$ZDOTDIR/90-local.zsh"
do
  [ -f "$rc" ] && source "$rc"
done
