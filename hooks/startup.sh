#!/usr/bin/env bash
set -euo pipefail

systemctl --user start noctalia-ready.target || true

bt_status=$(noctalia msg bluetooth-status)
wifi_status=$(noctalia msg wifi-status)

state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/noctalia"

bt_state=$(<"$state_dir/bt-state")
wifi_state=$(<"$state_dir/wifi-state")

if [[ "$bt_status" != "$bt_state" ]]; then
    noctalia msg bluetooth-toggle 
fi

if [[ "$wifi_status" != "$wifi_state" ]]; then
    noctalia msg wifi-toggle
fi
