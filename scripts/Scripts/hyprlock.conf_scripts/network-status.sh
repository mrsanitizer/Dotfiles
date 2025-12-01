#!/bin/bash

# Get the connected wifi SSID if any
wifi_ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)

# Check for Ethernet connection
ethernet=$(nmcli -t -f DEVICE,TYPE,STATE device | grep 'ethernet:connected' | cut -d':' -f1)

if [ -n "$ethernet" ]; then
    # Ethernet connected - show icon with padding space after to prevent clipping
    echo "󰈀  Ethernet"
elif [ -n "$wifi_ssid" ]; then
    # Wifi connected - show wifi icon with space + SSID name
    echo "󰖩  $wifi_ssid"
else
    # No network connected - show disconnected icon with space
    echo "󰖪  Disconnected"
fi

