#!/usr/bin/env bash
set -euo pipefail

# Use the threshold from the hook command, or fall back to 20%.
wifi_state=$(noctalia msg wifi-status)

# Keep a tiny state file so the script can compare this event with the last one.
state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/noctalia"
state_file="$state_dir/wifi-state"

mkdir -p "$state_dir"

if [[ "$wifi_state" != "$state_file" ]]; then
    printf '%s\n' "$wifi_state" > "$state_file"
fi
