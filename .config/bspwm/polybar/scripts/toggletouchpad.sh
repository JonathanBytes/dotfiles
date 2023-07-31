#!/bin/sh

id_touchpad=$(xinput | grep -o 'Touchpad.*id=[0-9]\+' | grep -o '[0-9]\+')
prop=$(xinput list-props "$id_touchpad" | grep -o 'Device Enabled (\([0-9]\+\))' | grep -o '[0-9]\+')
state=$(xinput list-props "$id_touchpad" | grep -o 'Device Enabled.*: *[^ ]*$' | grep -o '[0-9]\+$')

# temp_state=$(synclient | grep 'TouchpadOff')

# state=${temp_state: -1}

if [ $state == 1 ]
then
  # synclient TouchpadOff=1
  xinput set-prop $id_touchpad $prop 0
else
  #label-foreground = ${color.RED}
  # synclient TouchpadOff=0
  xinput set-prop $id_touchpad $prop 1
fi
