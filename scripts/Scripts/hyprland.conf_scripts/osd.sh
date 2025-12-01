#!/bin/bash

# --- CONFIGURATION ---
volume_step=5        # Change per keypress for volume
brightness_step=5    # Change per keypress for brightness
min_brightness=5     # Minimum brightness percentage (prevent black screen)
timeout=1000          # Notification popup milliseconds
# ---------------------

# --- Notif function: title, body, value(0-100), id, icon ---
send_notification() {
    notify-send "$1" "$2" \
        -h int:value:"$3" \
        -h string:x-canonical-private-synchronous:"$4" \
        -h int:transient:1 \
        -t "$timeout" \
        -u low \
        ${5:+-i "$5"}
}

# --- Pick icon for volume based on value and action ---
get_volume_icon() {
    local val="$1"
    local mute="$2"
    if [[ "$mute" == "true" ]]; then
        echo "audio-volume-muted"
    elif (( val == 0 )); then
        echo "audio-volume-muted"
    elif (( val > 66 )); then
        echo "audio-volume-high"
    elif (( val > 33 )); then
        echo "audio-volume-medium"
    else
        echo "audio-volume-low"
    fi
}

# --- Pick icon for mic (muted/unmuted) ---
get_mic_icon() {
    local mute="$1"
    if [[ "$mute" == "true" ]]; then
        echo "microphone-sensitivity-muted"
    else
        echo "microphone-sensitivity-high"
    fi
}

# --- Pick icon for brightness ---
get_brightness_icon() {
	echo "display-brightness-symbolic"
}

case "$1" in
    volume_up)
        pamixer -i "$volume_step"
        val=$(pamixer --get-volume)
        mute=$(pamixer --get-mute)
        icon=$(get_volume_icon "$val" "$mute")
        send_notification "Volume" "$val%" "$val" "vol_notify" "$icon"
        ;;
    volume_down)
        pamixer -d "$volume_step"
        val=$(pamixer --get-volume)
        mute=$(pamixer --get-mute)
        icon=$(get_volume_icon "$val" "$mute")
        send_notification "Volume" "$val%" "$val" "vol_notify" "$icon"
        ;;
    volume_mute)
        pamixer -t
        mute=$(pamixer --get-mute)
        val=$(pamixer --get-volume)
        icon=$(get_volume_icon "$val" "$mute")
        text=$([[ "$mute" == "true" ]] && echo "Muted" || echo "Unmuted: $val%")
        send_notification "Volume" "$text" "$val" "vol_notify" "$icon"
        ;;
    mic_mute)
        pamixer --default-source -t
        mute=$(pamixer --default-source --get-mute)
        val=$(pamixer --default-source --get-volume)
        icon=$(get_mic_icon "$mute")
        text=$([[ "$mute" == "true" ]] && echo "Muted" || echo "Live: $val%")
        send_notification "Microphone" "$text" "$val" "mic_notify" "$icon"
        ;;
    brightness_up)
        brightnessctl set +"$brightness_step"% > /dev/null
        val=$(brightnessctl -m | cut -d, -f4 | tr -d %)
        icon=$(get_brightness_icon "$val")
        send_notification "Brightness" "$val%" "$val" "bri_notify" "$icon"
        ;;
    brightness_down)
        current=$(brightnessctl -m | cut -d, -f4 | tr -d %)
        if (( current > min_brightness )); then
            brightnessctl set "$brightness_step"%- > /dev/null
        else
            brightnessctl set "$min_brightness"% > /dev/null
        fi
        val=$(brightnessctl -m | cut -d, -f4 | tr -d %)
        icon=$(get_brightness_icon "$val")
        send_notification "Brightness" "$val%" "$val" "bri_notify" "$icon"
        ;;
    *)
        echo "Usage: $0 {volume_up|volume_down|volume_mute|mic_mute|brightness_up|brightness_down}"
        exit 1
esac

