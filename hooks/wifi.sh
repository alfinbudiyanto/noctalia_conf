#!/usr/bin/env bash
set -euo pipefail

wifi_state=$(noctalia msg wifi-status)

# Keep a tiny state file so the script can compare this event with the last one.
state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/noctalia"
state_file="$state_dir/wifi-state"

mkdir -p "$state_dir"

previous=""
[[ -r "$state_file" ]] && previous="$(<"$state_file")"

[[ "$previous" != "$wifi_state" ]] || exit 0

printf '%s\n' "$wifi_state" > "$state_file"
