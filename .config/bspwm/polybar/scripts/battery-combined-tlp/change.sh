#!/bin/sh

state=$(cat /home/jonathan/polybar-scripts/polybar-scripts/battery-combined-tlp/var)

if [ $state == 0 ]
then
  sed -i 's/0/1/g' /home/jonathan/polybar-scripts/polybar-scripts/battery-combined-tlp/var
else
  sed -i 's/1/0/g' /home/jonathan/polybar-scripts/polybar-scripts/battery-combined-tlp/var
fi
