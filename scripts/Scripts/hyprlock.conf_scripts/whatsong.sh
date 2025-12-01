#!/bin/bash
# Check if playerctl is installed, if not install it: sudo pacman -S playerctl

if playerctl status 2>/dev/null | grep -q "Playing\|Paused"; then
    artist=$(playerctl metadata artist 2>/dev/null)
    title=$(playerctl metadata title 2>/dev/null)
    
    if [ -n "$artist" ] && [ -n "$title" ]; then
        echo "♫ $title - $artist"
    else
        echo "♫ $(playerctl metadata title 2>/dev/null)"
    fi
else
    echo "No music playing"
fi

