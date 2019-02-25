#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get output device ( secondary takes priority )
export MONITOR=`printf "" && (i3-msg -t get_outputs | cut -d '{' --output-delimiter=$'\n' -f1- | grep -Ei '.*(name)+.*(true)+.*' | cut -d '"' -f4 | tail -n 1)`

# Launch bar1 and bar2
polybar wpgtk &
