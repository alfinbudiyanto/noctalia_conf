#!/usr/bin/env bash
set -euo pipefail

power_profile="$(powerprofilesctl get)"

if [[ "$power_profile" == "performance" ]]; then
    powerprofilesctl set balanced
fi
