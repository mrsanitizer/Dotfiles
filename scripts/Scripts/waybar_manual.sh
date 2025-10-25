#!/usr/bin/env bash

# Check if Waybar is running
if pgrep -x waybar >/dev/null; then
    # Waybar is running → kill it
    pkill waybar
else
    # Waybar is not running → start it
    waybar &
fi
