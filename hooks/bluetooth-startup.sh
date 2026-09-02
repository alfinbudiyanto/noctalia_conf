#!/usr/bin/env bash
set -euo pipefail

state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/noctalia"
state_file="$state_dir/bluetooth-state"

previous=""
[[ -r "$state_file" ]] && previous="$(<"$state_file")"

[[ -n "$previous" ]] || exit 0
[[ "$previous" != "on" ]] || exit 0

noctalia msg bluetooth-disable
