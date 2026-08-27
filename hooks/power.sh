#!/usr/bin/env bash
set -euo pipefail

#systemctl --user stop backup-sync.service || true

wifi_status=$(noctalia msg wifi-status)
bt_status=$(noctalia msg bluetooth-status)

state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/noctalia"

wifi_state_file="$state_dir/wifi-state"
bt_state_file="$state_dir/bt-state"

if [[ "$wifi_status" != $(<"$wifi_state_file") ]]; then
    printf '%s\n' "$wifi_status" > "$wifi_state_file"
fi

if [[ "$bt_status" != $(<"$bt_state_file") ]]; then
    printf '%s\n' "$bt_status" > "$bt_state_file"
fi
