#!/usr/bin/env bash
set -euo pipefail

noctalia msg bar-show
noctalia msg dpms-on && notify-send 'Session resumed'

state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/noctalia"

bt_state_file=$(<"$state_dir/bt-state")
wifi_state_file=$(<"$state_dir/wifi-state")

if [[ "$bt_state_file" == "off" ]]; then
    noctalia msg bluetooth-disable
fi

if [[ "$wifi_state_file" == "off" ]]; then
    noctalia msg wifi-disable
fi
