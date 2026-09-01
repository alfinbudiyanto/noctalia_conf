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
