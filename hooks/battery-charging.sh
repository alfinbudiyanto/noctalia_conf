#!/usr/bin/env bash
set -euo pipefail

power_profile="$(powerprofilesctl get)"

if [[ "$power_profile" == "power-saver" ]]; then
    powerprofilesctl set balanced
fi
