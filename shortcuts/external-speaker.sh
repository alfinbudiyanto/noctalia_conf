#!/usr/bin/env bash

HARDWARE_SINK="alsa_output.pci-0000_00_1f.3.analog-stereo"

# Force physical sound card ports to Earphones and Earphone Mic
pactl set-sink-port "$HARDWARE_SINK" analog-output-headphones

# Create Virtual Speaker Sink for Earphones
pactl load-module module-null-sink \
    sink_name="EarphoneSpeaker" \
    sink_properties=device.description="EarphoneSpeaker"

# Loopback EarphoneSpeaker to physical headphone jack
pactl load-module module-loopback \
    source="EarphoneSpeaker.monitor" \
    sink="$HARDWARE_SINK" \
    source_dont_move=true \
    sink_dont_move=true

# Re-assert physical port selections
pactl set-sink-port "$HARDWARE_SINK" analog-output-headphones

