roles_dir="$ZDOTDIR/roles"

if [[ -n "${ROLES:-}" && ${(t)ROLES} != *array* ]]; then
  ROLES=(${=ROLES})
fi

host="${HOST:-$(hostname)}"

case "$host" in
  dorkbones)
    ROLES=(dev secrets)
    ;;
esac

typeset -ga ROLES

# If still empty, complain
if (( ${#ROLES} == 0 )); then
  echo "Warning: No ROLES set on this machine. Add them in inventory.nix or for this host ($HOST) in $ZDOTDIR/80-roles.zsh"
  return 0
fi

# Load roles that actually have a file; silently skip missing ones
for role in "${ROLES[@]}"; do
  role_file="$roles_dir/$role.zsh"
  [[ -r "$role_file" ]] && source "$role_file"
done
