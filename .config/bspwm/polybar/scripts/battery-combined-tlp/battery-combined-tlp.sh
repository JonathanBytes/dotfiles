#!/bin/sh

state=$(cat /home/jonathan/polybar-scripts/polybar-scripts/battery-combined-tlp/var)

if [ $state == 0 ]
then
  echo ""
else
  battery=$(acpi -i | head -n 1 | awk '{print $4}' | sed 's/.$//;s/.$//')
  echo " $battery %"
fi