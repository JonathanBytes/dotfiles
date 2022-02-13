#!/bin/bash

EMOJIS_PATH="$HOME/.config/bspwm/rofi/emoji-list"

line=`cat $EMOJIS_PATH | rofi -dmenu -theme ~/.config/bspwm/rofi/themes/launcher.rasi -i -markup-rows -p "" -columns 6`
[[ -z $line ]] && exit
a="${line#*>}"
b="${a%<*}"
echo -n $b | xsel -ipb

xdotool key Ctrl+Shift+v
