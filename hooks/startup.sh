#!/usr/bin/env bash
set -euo pipefail

systemctl --user start noctalia-ready.target || true

wifi_status=$(noctalia msg wifi-status)
bt_status=$(noctalia msg bluetooth-status)

state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/noctalia"

wifi_state=$(<"$state_dir/wifi-state")
bt_state=$(<"$state_dir/bt-state")

if [[ "$wifi_status" != "$wifi_state" ]]; then
    noctalia msg wifi-toggle
fi

if [[ "$bt_status" != "$bt_state" ]]; then
    noctalia msg bluetooth-toggle
fi
