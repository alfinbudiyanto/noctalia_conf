#!/usr/bin/env bash
set -euo pipefail

playerctl pause || true

wifi_status=$(noctalia msg wifi-status)
bt_status=$(noctalia msg bluetooth-status)

state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/noctalia"
#wifi_state=$(<"$state_dir/wifi-state")
bt_state="$state_dir/bt-state"

[[ "$bt_status" != $(<"$bt_state") ]] || exit 0

printf '%s\n' "$bt_status" > "$bt_state"
