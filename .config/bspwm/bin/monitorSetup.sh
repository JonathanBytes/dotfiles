#!/bin/bash

# Known Bug:
# Connect monitor, run script (laptop and monitor get 5 each)
# Restart bspwm
# Will end up with 15 desktops
# TODO: Fix remove_extra_from_external

# Check if bspwm is running:
pgrep bspwm > /dev/null || exit 0

LAPTOP='eDP-1' # Name of Laptop Screen
LAPTOP_WIDTH=1366
LAPTOP_HEIGHT=768

EXTERNAL='HDMI1' # Name of External screen
EXTERNAL_WIDTH=1920
EXTERNAL_HEIGHT=1080
EXTERNAL_Y_POS=LAPTOP_HEIGHT-EXTERNAL_HEIGHT

LAPTOP_DESK_COUNT=5 # Number of desktops to keep on laptop
EXT_REQ_DESK=5 # ???

LOG=''

get_stuff() {
	EXT_DISCONNECTED=$(xrandr | grep -o "${EXTERNAL} disconnected")
	EXT_CONNECTED=$(xrandr | grep -o "${EXTERNAL} connected")
	MONITOR_COUNT=$(bspc query -M | wc -l)
}

remove_default_desktop() {
    # The desktop "Desktop" is removed
    if [[ "$(bspc query -D --names | grep Desktop)" ]]; then
        LOG+='Removing "Desktop"\n'
        bspc desktop Desktop --remove > /dev/null
    fi
}

move_desktops_to_external() {
    i=1
    
    # Query desktops on Laptop
    for desktop in $(bspc query -D -m "$LAPTOP")
    do
        # Skip desktops till laptop count is reached
        if [ "$i" -le "$LAPTOP_DESK_COUNT" ]; then
            LOG+="Skipping: ${i}\n"
            ((i++))
            continue
        fi

        # Move each desktop to external monitor
        LOG+="Moving ${i} to ${EXTERNAL}\n"
        bspc desktop $desktop --to-monitor "$EXTERNAL"
	((i++))
    done
}

remove_extra_from_laptop() {
    i=1
    # Query desktops on Laptop
    for desktop in $(bspc query -D -m "$LAPTOP")
    do
        # Removes extra desktops from laptop
        if [ "$i" -gt "$LAPTOP_DESK_COUNT" ]; then
            LOG+="Removing from ${LAPTOP}: ${i}\n"
		    bspc desktop "$desktop" --remove
            continue
        fi
	((i++))
    done
}

# Manages to remove all desktops somehow
# Need to debug and fix
remove_extra_from_external() {
    i=1
    max=$LAPTOP_DESK_COUNT+$EXT_REQ_DESK
    # Query desktops on External
    for desktop in $(bspc query -D -m "$EXTERNAL")
    do
        echo "$i $EXT_REQ_DESK $desktop";
        # Removes extra desktops from external
        if [ "$i" -lt "$EXT_REQ_DESK" ]; then
            LOG+="Removing from ${EXTERNAL}: ${i}\n"
            bspc desktop "$desktop" --remove
            continue
        fi
	    ((i++))
    done
}

monitor_add() {
    # If required desktops already present on monitor
    EXT_DESK_COUNT=$(bspc query -D -m ${EXTERNAL} | wc -l)
    if [[ $EXT_DESK_COUNT -ge $EXT_REQ_DESK ]]; then
	    remove_extra_from_laptop
        # remove_extra_from_external
	    remove_default_desktop
        return 2
    fi

    move_desktops_to_external	
    remove_default_desktop
}

monitor_remove() {
    # Check if a single monitor is registerd by bspwm
    if [[ "$(bspc query -M | wc -l)" = 1 ]]
    then
        # Then do nothing
        exit
    fi

    # Adds 'Desktop' to HDMI
    bspc monitor "${EXTERNAL}" -a Desktop > /dev/null

    # Move desktops from EXT to Laptop
    for desktop in $(bspc query -D -m "${EXTERNAL}")
    do
        bspc desktop $desktop --to-monitor "${LAPTOP}"
    done
    
    bspc monitor "${EXTERNAL}" --remove > /dev/null

    bspc desktop Desktop -r
}

######################
# Actual Monitor Logic
######################

get_stuff

if [[ $EXT_CONNECTED ]] && [[ $MONITOR_COUNT = 1 ]]; then
	notify-send 'Monitor Setup', 'Monitor not found in bspc, adding with xrandr.'
	xrandr --output "$EXTERNAL" --mode 1920x1080 --pos 1366x0
	get_stuff
fi	

if [[ $EXT_CONNECTED ]] && [[ $MONITOR_COUNT = 2 ]]; then
	monitor_add
	notify-send 'Monitor Setup' 'Added Monitor'
fi

if [[ $EXT_DISCONNECTED ]] && [[ $MONITOR_COUNT = 2 ]]; then
	monitor_remove
	notify-send 'Monitor Setup' 'Removed Monitor'
fi

bspbar

echo "$LOG"
