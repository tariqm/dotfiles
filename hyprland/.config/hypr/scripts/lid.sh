#!/bin/bash

# lid.sh - Manage laptop and external displays based on lid state and AC power
# Usage: lid.sh

LAPTOP_DISPLAY="eDP-1"
EXTERNAL_MONITOR="HDMI-A-1"  # Change this to your external monitor name

# Check if lid is closed
if grep -q closed /proc/acpi/button/lid/*/state 2>/dev/null; then
    lid_closed="true"
else
    lid_closed="false"
fi

# Check if AC power is connected
ac_connected="false"
for adapter in /sys/class/power_supply/A{C,DP}*; do
    if [ -f "$adapter/online" ]; then
        if [ "$(cat "$adapter/online")" = "1" ]; then
            ac_connected="true"
            break
        fi
    fi
done

echo "Lid closed: $lid_closed"
echo "AC connected: $ac_connected"

if [ "$lid_closed" = "true" ]; then
    echo "Lid is closed - disabling laptop display"
    hyprctl keyword monitor "$LAPTOP_DISPLAY,disable"
    
    if [ "$ac_connected" = "true" ]; then
        echo "AC connected - enabling external monitor"
        hyprctl keyword monitor "$EXTERNAL_MONITOR,preferred,auto,1"
    else
        echo "AC not connected - disabling external monitor for power saving"
        hyprctl keyword monitor "$EXTERNAL_MONITOR,disable"
    fi
else
    echo "Lid is open - enabling laptop display"
    hyprctl keyword monitor "$LAPTOP_DISPLAY,preferred,auto,1"
    
    # Optionally enable external monitor if it's detected and connected
    if hyprctl monitors -j | jq -r '.[].name' | grep -q "$EXTERNAL_MONITOR" 2>/dev/null; then
        echo "External monitor detected - enabling it as well"
        hyprctl keyword monitor "$EXTERNAL_MONITOR,preferred,auto,1"
    fi
fi