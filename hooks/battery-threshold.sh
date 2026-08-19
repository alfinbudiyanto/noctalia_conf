#!/usr/bin/env bash
set -euo pipefail

# Use the threshold from the hook command, or fall back to 20%.
threshold="${NOCTALIA_BATTERY_THRESHOLD:-20}"

# Keep a tiny state file so the script can compare this event with the last one.
state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/noctalia"
state_file="$state_dir/battery-percent"

# Noctalia provides these values whenever battery_percentage_changed fires.
percent="${NOCTALIA_BATTERY_PERCENT:-}"
battery_state="${NOCTALIA_BATTERY_STATE:-unknown}"

# Ignore the event if the percentage is missing or not a whole number.
[[ "$percent" =~ ^[0-9]+$ ]] || exit 0

mkdir -p "$state_dir"

# Read the previous percentage, then save the current percentage for next time.
previous=""
[[ -r "$state_file" ]] && previous="$(<"$state_file")"
printf '%s\n' "$percent" > "$state_file"

# Only warn while discharging, and only after we have a previous value to compare.
[[ "$battery_state" == "discharging" ]] || exit 0
[[ "$previous" =~ ^[0-9]+$ ]] || exit 0

# Fire once when crossing below the threshold, not every time the battery changes below it.
if (( previous >= threshold && percent < threshold )); then
  notify-send -u critical "Battery low" "Battery is ${percent}%."

  power_profile="$(powerprofilesctl get)"
  if [[ "$power_profile" != "power-saver" ]]; then
    powerprofilesctl set power-saver
  fi
  # Or run any other command, for example:
  # systemctl --user start low-battery.target
fi
