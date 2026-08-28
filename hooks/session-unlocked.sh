#!/usr/bin/env bash
set -euo pipefail

noctalia msg bar-show
noctalia msg dpms-on && notify-send 'Session resumed'

bt_status=$(noctalia msg bluetooth-status)
wifi_status=$(noctalia msg wifi-status)

state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/noctalia"

bt_state_file=$(<"$state_dir/bt-state")
wifi_state_file=$(<"$state_dir/wifi-state")

if [[ "$bt_status" != "$bt_state_file" ]]; then
    if [[ "$bt_status" == "on" ]]; then
        noctalia msg bluetooth-enable
    fi

    if [[ "$bt_status" == "off" ]]; then
        noctalia msg bluetooth-disable
    fi
fi

if [[ "$wifi_status" != "$wifi_state_file" ]]; then
    if [[ "$wifi_status" == "on" ]]; then
      	noctalia msg wifi-enable
    fi

    if [[ "$wifi_status" == "off" ]]; then
        noctalia msg wifi-disable
    fi
fi
