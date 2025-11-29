# Wire Starship into the generic theme loader
starship_cmd="${STARSHIP_CMD:-starship}"

if ! command -v "$starship_cmd" >/dev/null 2>&1; then
  echo "Warning: Starship command '$starship_cmd' not found; install it or pick another theme." >&2
  return 1
fi

# Default location where this repo syncs the config
_default_starship_config="${XDG_CONFIG_HOME:-$HOME/.config}/starship.toml"
export STARSHIP_CONFIG="${STARSHIP_CONFIG:-$_default_starship_config}"

# shellcheck disable=SC1090 # script provided by starship
source <("$starship_cmd" init zsh --print-full-init)
