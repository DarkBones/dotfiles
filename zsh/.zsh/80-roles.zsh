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
  if [[ -d "$roles_dir" ]]; then
    all_roles=("${(@f)$(ls -1 "$roles_dir"/*.zsh 2>/dev/null | xargs -n1 basename | sed 's/\.zsh$//')}")
    all_roles=("${(@on)all_roles}")
    ROLES=("${all_roles[@]}")
  fi
fi

typeset -ga ROLES

# Load roles that actually have a file; silently skip missing ones
for role in "${ROLES[@]}"; do
  role_file="$roles_dir/$role.zsh"
  [[ -r "$role_file" ]] && source "$role_file"
done
