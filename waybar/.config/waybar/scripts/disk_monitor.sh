#!/usr/bin/env bash

# Overall disk usage
df_out=$(df -h / | awk 'NR==2')
used_percent=$(echo "$df_out" | awk '{print $5}')
used=$(echo "$df_out" | awk '{print $3}')
total=$(echo "$df_out" | awk '{print $2}')

# Accessible subvolumes
declare -a subvols=( "/" "/home" "/.snapshots" "/var/cache/pacman/pkg" )
breakdown=""

for path in "${subvols[@]}"; do
  if [[ -d "$path" ]] && mountpoint -q "$path"; then
    size=$(du -shx "$path" 2>/dev/null | awk '{print $1}')
    breakdown+="• $path: $size\n"
  fi
done

# Escape newlines
escaped_breakdown=$(echo -e "$breakdown" | sed ':a;N;$!ba;s/\n/\\n/g')

# Output single-line JSON with no trailing newline
printf '{"text": " %s", "tooltip": "Disk usage: %s / %s (%s)\\n\\n%s"}' \
  "$used_percent" "$used" "$total" "$used_percent" "$escaped_breakdown"
