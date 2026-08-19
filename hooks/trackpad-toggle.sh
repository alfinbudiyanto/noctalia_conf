#!/bin/sh

driftwm msg action "set-trackpad toggle"
noctalia msg keyboard-backlight-osd 99 && notify-send "⬅️ Trackpad" "⬅️ Trackpad toggled On/Off \n⬅️ For the TrackPad BTW"
