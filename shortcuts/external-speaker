#!/usr/bin/env bash

HARDWARE="alsa_output.pci-0000_00_1f.3.analog-stereo"

# 1. Disable Auto-Mute & set ALSA levels
amixer -c 0 cset name='Auto-Mute Mode' "Disabled" >/dev/null 2>&1 || amixer -c 0 set 'Auto-Mute Mode' Disabled >/dev/null 2>&1
amixer -c 0 set Speaker 0% mute >/dev/null 2>&1
amixer -c 0 set Headphone 100% unmute >/dev/null 2>&1

# 2. Force PulseAudio card port
pactl set-sink-port "$HARDWARE" analog-output-headphones >/dev/null 2>&1

# 3. Re-link PipeWire graph
pw-link -d InternalSpeaker:output_FL "$HARDWARE":playback_FL >/dev/null 2>&1
pw-link -d InternalSpeaker:output_FR "$HARDWARE":playback_FR >/dev/null 2>&1

pw-link EarphoneSpeaker:output_FL "$HARDWARE":playback_FL >/dev/null 2>&1
pw-link EarphoneSpeaker:output_FR "$HARDWARE":playback_FR >/dev/null 2>&1
