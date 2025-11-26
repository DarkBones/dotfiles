#!/bin/sh

# Get Wi-Fi name
wifi_name=$(networksetup -getairportnetwork en0 | awk -F': ' '{print $2}')

if [ ${#wifi_name} -gt 9 ]; then
  wifi_name=$(echo "$wifi_name" | cut -c 1-6)
  wifi_name="${wifi_name}..."
fi

# Get Wi-Fi signal strength
signal_strength=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/agrCtlRSSI/{print $2}')

# Set the icon based on signal strength
if [ "$signal_strength" -ge -60 ]; then
  ICON="󰤨"
elif [ "$signal_strength" -ge -70 ]; then
  ICON="󰤥"
elif [ "$signal_strength" -ge -80 ]; then
  ICON="󰤢"
else
  ICON="󰤟"
fi

# Update the sketchybar item without the signal strength
sketchybar --set "$NAME" icon="$ICON" label="${wifi_name}"
