export EDITOR=${EDITOR:-nvim}
export VISUAL=${VISUAL:-$EDITOR}
export LANG=${LANG:-en_US.UTF-8}
export COLORTERM=${COLORTERM:-truecolor}

# Identity switches overridable per machine (E.g. via HM)
export OS_TYPE=${OS_TYPE:-$(uname | tr '[:upper:]' '[:lower:]')}
export MACHINE_ROLE=${MACHINE_ROLE:-personal} # personal / work / etc.

# Safe HM vars
if [ -r "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
  . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
fi

# Developer home
export DEV_HOME=${DEV_HOME:-"$HOME/Developer"}

# --- Resolve *_SECRET_PATH variables into *_SECRET (actual secret values) ---
for var in ${(k)parameters}; do
  # Only variables ending with _SECRET_PATH
  [[ "$var" == *_SECRET_PATH ]] || continue

  # Read value of $var (secret_path to secret)
  local secret_path="${(P)var}"

  # Must be an absolute readable file pointing inside /run/secrets/
  if [[ -n "$secret_path" && -r "$secret_path" && "$secret_path" == /run/secrets/* ]]; then
    # Strip suffix: FOO_SECRET_PATH → FOO
    local base="${var%_SECRET_PATH}"

    # Read file content into the new variable name
    local value
    value="$(<"$secret_path")"

    # Export new variable holding the actual secret
    export "$base=$value"
  fi
done
