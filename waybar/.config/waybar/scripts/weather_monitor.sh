#!/usr/bin/env bash

# Get weather for Karlsruhe from wttr.in
raw_weather=$(curl -s "https://wttr.in/Karlsruhe?format=%c+%t" || echo "N/A")

# Trim excessive whitespace (e.g. ☁️   +8°C -> ☁️ +8°C)
weather=$(echo "$raw_weather" | sed -E 's/[[:space:]]+/ /g' | xargs)

# Output JSON for Waybar
echo "{\"text\": \"$weather\", \"tooltip\": \"Weather in Karlsruhe\"}"
# echo "{\"text\": \"tmp disabled\", \"tooltip\": \"Weather in Karlsruhe\"}"
