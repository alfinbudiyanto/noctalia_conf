#!/usr/bin/env bash
set -euo pipefail

bt_state=$(noctalia msg bluetooth-status)

# Keep a tiny state file so the script can compare this event with the last one.
state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/noctalia"
state_file="$state_dir/bt-state"

mkdir -p "$state_dir"

previous=""
[[ -r "$state_file" ]] && previous="$(<"$state_file")"

[[ "$previous" != "$bt_state" ]] || exit 0

printf '%s\n' "$bt_state" > "$state_file"
