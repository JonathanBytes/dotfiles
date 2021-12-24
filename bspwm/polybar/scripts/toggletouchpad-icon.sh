#!/bin/sh

temp_state=$(synclient | grep 'TouchpadOff')

state=${temp_state: -1}

if [ $state == 0 ]
then
  #label-foreground = ${color.CYAN}
  echo ""
else
  #label-foreground = ${color.RED}
  echo ""
fi
