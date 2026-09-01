#!/usr/bin/env bash
set -euo pipefail

playerctl pause || true
noctalia msg bar-hide

bt_status=$(noctalia msg bluetooth-status)
wifi_status=$(noctalia msg wifi-status)

state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/noctalia"

bt_state_file=$(<"$state_dir/bt-state")
wifi_state_file=$(<"$state_dir/wifi-state")

if [[ "$bt_state_file" != "$bt_status" ]]; then
    printf '%s\n' "$bt_status" > "$bt_state"
fi

if [[ "$wifi_state_file" != "$wifi_status" ]]; then
    printf '%s\n' "$wifi_status" > "$wifi_state"
fi
