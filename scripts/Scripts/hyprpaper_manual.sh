#!/usr/bin/env bash

# Check if hyprpaper is running
if pgrep -x hyprpaper >/dev/null; then
    # Waybar is running → kill it
    pkill hyprpaper
else
    # if hyprpaper is not running → start it
    hyprpaper &
fi
