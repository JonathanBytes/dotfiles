#!/bin/sh

temp_state=$(synclient | grep 'TouchpadOff')

state=${temp_state: -1}

if [ $state == 0 ]
then
  synclient TouchpadOff=1
else
  #label-foreground = ${color.RED}
  synclient TouchpadOff=0
fi
