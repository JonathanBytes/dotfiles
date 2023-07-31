#!/bin/sh
id_touchpad=$(xinput | grep -o 'Touchpad.*id=[0-9]\+' | grep -o '[0-9]\+')
prop=$(xinput list-props "$id_touchpad" | grep -o 'Device Enabled (\([0-9]\+\))' | grep -o '[0-9]\+')
state=$(xinput list-props "$id_touchpad" | grep -o 'Device Enabled.*: *[^ ]*$' | grep -o '[0-9]\+$')

# temp_state=$(synclient | grep 'TouchpadOff')

# state=${temp_state: -1}

if [ $state == 1 ]
then
  echo ""
else
	echo "%{F#FA5841}%{u-}"
fi
