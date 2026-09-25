#!/usr/bin/env bash

HARDWARE="alsa_output.pci-0000_00_1f.3.analog-stereo"

# 1. Hardware ALSA Controls
amixer -c 0 set 'Auto-Mute Mode' Disabled >/dev/null 2>&1
amixer -c 0 set Speaker mute 0% >/dev/null 2>&1
amixer -c 0 set Headphone unmute 100% >/dev/null 2>&1

# 2. PulseAudio Port Selection
pactl set-sink-port "$HARDWARE" analog-output-headphones >/dev/null 2>&1

# 3. PipeWire Routing
pw-link -d InternalSpeaker:output_FL "$HARDWARE":playback_FL >/dev/null 2>&1
pw-link -d InternalSpeaker:output_FR "$HARDWARE":playback_FR >/dev/null 2>&1

pw-link EarphoneSpeaker:output_FL "$HARDWARE":playback_FL >/dev/null 2>&1
pw-link EarphoneSpeaker:output_FR "$HARDWARE":playback_FR >/dev/null 2>&1
