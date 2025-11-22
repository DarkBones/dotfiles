roles_dir="$ZDOTDIR/roles"

host="${HOST:-$(hostname)}"

case "$host" in
  dorkbones)
    ROLES=(dev secrets)
    ;;
  *)
    ROLES=()
    ;;
esac

# If still empty, load ALL the role files
if (( ${#ROLES} == 0 )); then
  echo "Warning: No ROLES set on this machine. Add them for this host ($HOST) on $ZDOTDIR/80-roles.zsh"
  exit 0
fi

typeset -ga ROLES

# Load roles that actually have a file; silently skip missing ones
for role in "${ROLES[@]}"; do
  role_file="$roles_dir/$role.zsh"
  [[ -r "$role_file" ]] && source "$role_file"
done
