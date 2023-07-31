#!/bin/sh

# Debian
id_touchpad=$(xinput | grep -o 'Touchpad.*id=[0-9]\+' | grep -o '[0-9]\+')
prop=$(xinput list-props "$id_touchpad" | grep -o 'Device Enabled (\([0-9]\+\))' | grep -o '[0-9]\+')
state=$(xinput list-props "$id_touchpad" | grep -o 'Device Enabled.*: *[^ ]*$' | grep -o '[0-9]\+$')
# ----- 

# temp_state=$(synclient | grep 'TouchpadOff') # ArchLinux
# state=${temp_state: -1} # ArchLinux

if [ $state == 1 ]
then
  # synclient TouchpadOff=1 # ArchLinux
  xinput set-prop $id_touchpad $prop 0 # Debian
else
  # synclient TouchpadOff=0 # ArchLinux
  xinput set-prop $id_touchpad $prop 1 # Debian
fi
