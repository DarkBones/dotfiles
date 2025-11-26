#!/bin/bash

# Get true connection status using more reliable methods
PAIRED_DEVICES=$(bluetoothctl devices Paired | wc -l)
CONNECTED_DEVICES=$(bluetoothctl info | grep 'Connected: yes' | wc -l)

if bluetoothctl show | grep -q "Powered: yes"; then
    # Bluetooth is on
    if [ $CONNECTED_DEVICES -gt 0 ]; then
        ICON="󰂯"
        # Get the name of the connected device
        DEVICE_NAME=$(bluetoothctl info | grep -o 'Name: .*' | cut -d ' ' -f 2-)
        TEXT="Connected to $DEVICE_NAME"
    else
        ICON="󰂯"
        TEXT="On"
    fi
    
    TOOLTIP="Bluetooth: On\nPaired devices: $PAIRED_DEVICES\nConnected devices: $CONNECTED_DEVICES"
    if [ $CONNECTED_DEVICES -gt 0 ]; then
        TOOLTIP="$TOOLTIP\nConnected to: $DEVICE_NAME"
    fi
else
    # Bluetooth is off
    ICON="󰂲"
    TEXT="Off"
    TOOLTIP="Bluetooth: Off"
fi

echo "{\"text\": \"$ICON\", \"tooltip\": \"$TOOLTIP\"}"
