#!/bin/bash

status=$(xrandr --query | grep 'HDMI1')
connected="HDMI1 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 520mm x 290mm"

if [ "$status" = "$connected" ]; then
  bspc monitor HDMI1 -d '' '' '' ''
  bspc monitor eDP1 -d   '' '' '' '' '' 
else
  bspc monitor HDMI1 --remove
  bspc monitor eDP1 -d '' '' '' '' '' '' '' '' 
fi
