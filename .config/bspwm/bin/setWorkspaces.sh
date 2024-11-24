#!/bin/bash

status=$(xrandr --query | grep 'HDMI1')
connected=' connected'

if grep -q "$connected" <<< "$status"; then
  bspc monitor HDMI1 -d '' '' '' ''
  bspc monitor eDP-1 -d '' '' '' '' '' 
else
  bspc monitor HDMI1 --remove
  bspc monitor eDP-1 -d '' '' '' '' '' '' '' '' 
fi
