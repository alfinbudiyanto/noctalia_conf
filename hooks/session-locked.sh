#!/usr/bin/env bash
set -euo pipefail

wifi_status=$(noctalia msg wifi-status)
bt_status=$(noctalia msg bluetooth-status)


state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/noctalia"
#wifi_state=$(<"$state_dir/wifi-state")
bt_state="$state_dir/bt-state"

#mkdir -p "$wifi_state"
#mkdir -p "$bt_state"

[[ "$bt_status" != $(<"$bt_state") ]] || exit 0

printf '%s\n' "$bt_status" > "$bt_state"
