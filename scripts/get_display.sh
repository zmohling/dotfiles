# Get output device ( secondary takes priority )

case "$1" in
    primary)
        xrandr --current | awk '/ connected primary/{ print $1 }'
        exit 0;
        ;;
    secondary)
        xrandr --current | awk '/ connected [^p]/{ print $1 }'
        exit 0;
        ;;
    *)
        echo "== ! get_display.sh: Missing or Invalid Argument ! =="
        echo "Try again with: primary | secondary"
        exit 1;
        ;;


esac
