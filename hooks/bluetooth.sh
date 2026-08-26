#!/usr/bin/env bash
set -euo pipefail

bt_state=$(noctalia msg bluetooth-status)

# Keep a tiny state file so the script can compare this event with the last one.
state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/noctalia"
state_file="$state_dir/bt-state"

mkdir -p "$state_dir"

if [[ "$bt_state" != "$state_file" ]]; then
    printf '%s\n' "$bt_state" > "$state_file"
fi
