export EDITOR=${EDITOR:-nvim}
export VISUAL=${VISUAL:-$EDITOR}
export LANG=${LANG:-en_US.UTF-8}
export COLORTERM=${COLORTERM:-truecolor}

# Identity switches overridable per machine (E.g. via HM)
export OS_TYPE=${OS_TYPE:-$(uname | tr '[:upper:]' '[:lower:]')}
export MACHINE_ROLE=${MACHINE_ROLE:-personal} # personal / work / etc.

# Developer home
export DEV_HOME=${DEV_HOME:-"$HOME/Developer"}

# Safe HM vars (works on NixOS + non-Nix)
_hm_session_vars_candidates=(
  "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
  "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh"
  "/nix/var/nix/profiles/per-user/$USER/home-manager/etc/profile.d/hm-session-vars.sh"
)

for f in "${_hm_session_vars_candidates[@]}"; do
  if [ -r "$f" ]; then
    export HM_VARS_LOADED_FROM="$f"
    . "$f"
    break
  fi
done

unset _hm_session_vars_candidates
