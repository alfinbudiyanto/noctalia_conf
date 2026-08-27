#!/usr/bin/env bash
set -euo pipefail

playerctl pause || true

wifi_status=$(noctalia msg wifi-status)
bt_status=$(noctalia msg bluetooth-status)

state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/noctalia"

wifi_state="$state_dir/wifi-state"
bt_state="$state_dir/bt-state"

if [[ $(<"$wifi_state") != "$wifi_status" ]]; then
    printf '%s\n' "$wifi_status" > "$wifi_state"
fi

if [[ $(<"$bt_state") != "$bt_status" ]]; then
    printf '%s\n' "$bt_status" > "$bt_state"
fi
