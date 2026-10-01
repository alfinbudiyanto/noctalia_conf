#!/usr/bin/env bash
set -euo pipefail

case "${NOCTALIA_POWER_PROFILE:-}" in
    power-saver)
        noctalia msg brightness-set eDP-1 3
        ;;
    balanced|performance)
        noctalia msg brightness-set eDP-1 10
        ;;
esac

power_profile_prev="${NOCTALIA_POWER_PROFILE_PREVIOUS:-}"

state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/noctalia"
state_file="$state_dir/power-profile-prev"

mkdir -p "$state_dir"

[[ -n "$power_profile_prev" ]] || exit 0

printf '%s\n' "$power_profile_prev" > "$state_file"
