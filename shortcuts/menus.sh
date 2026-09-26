#!/usr/bin/env bash

HARDWARE_SINK="alsa_output.pci-0000_00_1f.3.analog-stereo"

# Create Virtual Sinks
pactl load-module module-null-sink \
    media.class=Audio/Sink \
    sink_name="EarphoneSpeaker" \
    sink_properties=device.description="EarphoneSpeaker" 2>/dev/null

pactl load-module module-null-sink \
    media.class=Audio/Sink \
    sink_name="InternalSpeaker" \
    sink_properties=device.description="InternalSpeaker" 2>/dev/null

# # Persistent Earphone Loopback with Tag
# pactl load-module module-loopback \
#     source="EarphoneSpeaker.monitor" \
#     sink="$HARDWARE_SINK" \
#     sink_dont_move=true \
#     source_dont_move=true \
#     sink_input_properties="loopback.target=earphones" 2>/dev/null

# # Persistent Internal Speaker Loopback with Tag
# pactl load-module module-loopback \
#     source="InternalSpeaker.monitor" \
#     sink="$HARDWARE_SINK" \
#     sink_dont_move=true \
#     source_dont_move=true \
#     sink_input_properties="loopback.target=speakers" 2>/dev/null
