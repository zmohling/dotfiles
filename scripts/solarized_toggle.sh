#!/usr/bin/env bash

BACKGROUND=$(cat ~/.vimrc | awk -F= '/background/{ print $2 }')

set -e
shopt -s expand_aliases

BASE16_SHELL="$HOME/.config/base16-shell/"
eval "$("$BASE16_SHELL/profile_helper.sh")"

case "$BACKGROUND" in
    dark)
        wpg -s trianglify_solarized.png
        sed -i 's/set background=dark/set background=light/' ~/.vimrc && \
            echo "[i] color         wrote: .vimrc"
        base16_solarized-light && \
            echo "[i] color         wrote: base16_shell"
        ;;
    light)
        wpg -s trianglify_solarized_dark.png
        sed -i 's/set background=light/set background=dark/' ~/.vimrc && \
            echo "[i] color         wrote: .vimrc"
        base16_solarized-dark && \
            echo "[i] color         wrote: base16_shell"
        ;;
    *)
        echo "solarize_toggle ERROR: BACKGROUND NOT FOUND IN VIMRC"
        exit 1
        ;;
esac
