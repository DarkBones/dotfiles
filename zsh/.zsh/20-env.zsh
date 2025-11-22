export EDITOR=${EDITOR:-nvim}
export VISUAL=${VISUAL:-$EDITOR}
export LANG=${LANG:-en_US.UTF-8}

# Identity switches overridable per machine (E.g. via HM)
export OS_TYPE=${OS_TYPE:-$(uname | tr '[:upper:]' '[:lower:]')}
export MACHINE_ROLE=${MACHINE_ROLE:-personal} # personal / work / etc.

# Developer home
export DEV_HOME=${DEV_HOME:-"$HOME/Developer"}

# Safe HM vars
if [ -r "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
  . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
fi
