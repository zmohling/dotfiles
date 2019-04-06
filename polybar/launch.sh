#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Set display
export MONITOR=$($HOME/.config/scripts/get_display.sh secondary)

# Launch bar1 and bar2
polybar wpgtk &
