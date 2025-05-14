#!/bin/bash

MOUSE_ID=$(xinput list --id-only "SteelSeries SteelSeries Rival 3")

# If the device was found, set its properties
if [ -n "$MOUSE_ID" ]; then
    xinput set-prop "$MOUSE_ID" "libinput Accel Speed" 0.4
    xinput set-prop "$MOUSE_ID" "libinput Accel Profile Enabled" 0, 1
fi
