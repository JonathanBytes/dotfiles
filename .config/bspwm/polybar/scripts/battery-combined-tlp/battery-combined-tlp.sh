#!/bin/sh

state=$(cat /home/jonathan/.config/bspwm/polybar/scripts/battery-combined-tlp/var)

if [ $state == 0 ]
then
  echo ""
else
  battery=$(acpi -i | head -n 1 | awk '{print $4}' | sed 's/.$//;s/.$//')
  if [ $battery == 100 ]
  then
    echo " 100%"
  elif [ $battery == "chargin" ]
  then
    echo " Connecting"
  else
    echo " $battery%"
  fi
fi
