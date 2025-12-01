#!/bin/bash

# Get battery level and remove ALL whitespace/newlines
battery_level=$(acpi -b 2>/dev/null | grep -v ' 0%' | grep -oP '[0-9]+(?=%)' | tr -d '\n\r ')
charging=$(acpi -b 2>/dev/null | grep -c "Charging")

if [ -z "$battery_level" ]; then
    echo ""
elif [ "$charging" -eq 1 ]; then
    icon="󰂄"  # Charging icon
    echo "$icon $battery_level%"
else
    if [ "$battery_level" -ge 80 ]; then
        icon="󰁹"  # Full battery
    elif [ "$battery_level" -ge 60 ]; then
        icon="󰂀"  # 75% battery
    elif [ "$battery_level" -ge 40 ]; then
        icon="󰁾"  # 50% battery
    elif [ "$battery_level" -ge 20 ]; then
        icon="󰁻"  # 25% battery
    else
        icon="󰁺"  # Low battery
    fi
    echo "$icon $battery_level%"
fi


