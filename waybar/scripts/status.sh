#!/bin/bash

WHO="Manually Block"
WHY="Manual block requested"
WHAT="sleep"

# Icons for Waybar display (Font Awesome)
ICON_LOCKED=""
ICON_UNLOCKED=""

# Find PID of the running inhibitor matching parameters
PID=$(pgrep -fn "systemd-inhibit --who=\"$WHO\" --why=\"$WHY\" --what=$WHAT sleep infinity")

if [[ $1 == "toggle" ]]; then
    if [[ -z "$PID" ]]; then
        # Start block in background suppressed output
        nohup systemd-inhibit --who="$WHO" --why="$WHY" --what=$WHAT sleep infinity >/dev/null 2>&1 &
    else
        # Stop existing inhibitor process
        kill "$PID"
    fi
fi

# Check running state and output JSON for Waybar
if [[ -z "$PID" ]]; then
    echo "{\"text\": \"$ICON_UNLOCKED\"}"
else
    echo "{\"text\": \"$ICON_LOCKED\"}"
fi
