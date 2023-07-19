#!/bin/sh

BAR_HEIGHT=26  # polybar height
BORDER_SIZE=1  # border size from your wm settings
YAD_WIDTH=250  # 222 is minimum possible value
YAD_HEIGHT=200 # 193 is minimum possible value
DATE="$(date +"%I:%M %p")"

case "$1" in
--popup)
    if [ "$(xdotool getwindowfocus getwindowname)" = "yad-calendar" ]; then
        exit 0
    fi

    eval "$(xdotool getmouselocation --shell)"
    # eval "$(xdotool getdisplaygeometry --shell)"
    WIDTH=$(xrandr | grep current | sed "s/Screen 0: minimum 8 x 8, current //" | cut -f1 -d"," | cut -f1 -d" ")
    HEIGHT=$(xrandr | grep current | sed "s/Screen 0: minimum 8 x 8, current //" | cut -f1 -d"," | grep -Eo '[0-9]+$')

    # X
    if [ "$((X + YAD_WIDTH / 2 + BORDER_SIZE))" -gt "$WIDTH" ]; then #Right side
        : $((pos_x = WIDTH - YAD_WIDTH - BORDER_SIZE))
    elif [ "$((X - YAD_WIDTH / 2 - BORDER_SIZE))" -lt 0 ]; then #Left side
        : $((pos_x = BORDER_SIZE))
    else #Center
        : $((pos_x = X - YAD_WIDTH / 2))
    fi

    # Y
    if [ "$Y" -gt "$((HEIGHT / 2))" ]; then #Bottom
        : $((pos_y = HEIGHT - YAD_HEIGHT - BAR_HEIGHT - BORDER_SIZE))
    else #Top
        : $((pos_y = BAR_HEIGHT + BORDER_SIZE))
    fi

    yad --calendar --undecorated --fixed --close-on-unfocus --no-buttons \
        --width="$YAD_WIDTH" --height="$YAD_HEIGHT" --posx="$pos_x" --posy="$pos_y" \
        --title="yad-calendar" --borders=0 >/dev/null &
    ;;
*)
    echo "$DATE"
    ;;
esac
