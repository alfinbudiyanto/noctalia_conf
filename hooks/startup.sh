#!/usr/bin/env bash
set -euo pipefail

systemctl --user start noctalia-ready.target || true

state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/noctalia"

bt_state_file=$(<"$state_dir/bt-state")
wifi_state_file=$(<"$state_dir/wifi-state")

if [[ "$bt_state_file" == "off" ]]; then
    noctalia msg bluetooth-disable
fi

if [[ "$wifi_state_file" == "off" ]]; then
    noctalia msg wifi-disable
fi
