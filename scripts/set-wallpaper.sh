#!/bin/bash

# Wpgtk uses feh to set the wallpaper, but it often doesn't work with odd
# images sizes and multiple monitors. This script moves the current theme's
# wallpaper to ~/pictures/wallpapers/current/wallpaper to be accessable by
# i3's feh command and our own here.

WALLPAPERS_DIR="/home/$USER/pictures/wallpapers"
CURR_WALLPAPER_R_PATH="current/wallpaper"
CURR_WALLPAPER=`wpg -c`;

diff "$WALLPAPERS_DIR/$CURR_WALLPAPER" "$WALLPAPERS_DIR/$CURR_WALLPAPER_R_PATH"
if [ $? -eq 1 ]; then
    notify-send "Wallpaper Updated"

    \cp -f "$WALLPAPERS_DIR/$CURR_WALLPAPER" "$WALLPAPERS_DIR/$CURR_WALLPAPER_R_PATH" && \
    feh --bg-fill --no-xinerama /home/zachary/pictures/wallpapers/current/wallpaper && \
    betterlockscreen -u "$WALLPAPERS_DIR/$CURR_WALLPAPER_R_PATH" -b 3
fi
