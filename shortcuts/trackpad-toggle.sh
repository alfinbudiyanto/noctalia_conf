#!/usr/bin/env bash
set -euo pipefail

driftwm msg action "set-trackpad toggle"
noctalia msg keyboard-backlight-osd 99 && notify-send '👈Trackapd' "👈 Trackpad toggled On/Off!\\n👈 For the Trackpad BTW🤙😁"
