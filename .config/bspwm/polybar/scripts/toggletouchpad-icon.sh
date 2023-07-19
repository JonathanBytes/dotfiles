#!/bin/sh

temp_state=$(synclient | grep 'TouchpadOff')

state=${temp_state: -1}

if [ $state == 0 ]
then
  echo ""
else
	echo "%{F#FA5841}%{u-}"
fi
