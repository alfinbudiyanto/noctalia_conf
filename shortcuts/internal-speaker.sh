#!/usr/bin/env bash

HARDWARE_SINK="alsa_output.pci-0000_00_1f.3.analog-stereo"

# Force physical ports
pactl set-sink-port "$HARDWARE_SINK" analog-output-speaker

# Create InternalSpeaker null sink
pactl load-module module-null-sink \
    sink_name="InternalSpeaker" \
    sink_properties=device.description="InternalSpeaker"

# Route InternalSpeaker to internal speakers
pactl load-module module-loopback \
    source="InternalSpeaker.monitor" \
    sink="$HARDWARE_SINK" \
    source_dont_move=true \
    sink_dont_move=true

# Re-assert physical ports
pactl set-sink-port "$HARDWARE_SINK" analog-output-speaker
