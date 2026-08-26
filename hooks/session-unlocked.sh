#!/usr/bin/env bash
set -euo pipefail

bt_status=$(noctalia msg bluetooth-status)
state_dir=$(<"${XDG_STATE_HOME:-$HOME/.local/state}/noctalia/bt-state")

[[ "$bt_status" != "$state_dir" ]] || exit 0

[[ "$bt_status" == "on" ]] || {
    noctalia msg bluetooth-enable
    exit 0
}

noctalia msg bluetooth-disable
