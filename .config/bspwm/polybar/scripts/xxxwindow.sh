#!/bin/bash

WM_DESKTOP=$(xdotool getwindowfocus)
gimp="imp"
term="jonathan@ArchDell"
white=#D9CBA5

if [ $WM_DESKTOP == "1310" ]; then

	echo ""
	# echo " "

elif [ $WM_DESKTOP != "1883" ]; then

	WM_CLASS=$(xprop -id $(xdotool getactivewindow) WM_CLASS | awk 'NF {print $NF}' | sed 's/"/ /g')
	WM_NAME=$(xprop -id $(xdotool getactivewindow) WM_NAME | awk 'NF {print $NF}' | sed 's/"/ /g')
	WM_NAMER=$(xprop -id $(xdotool getactivewindow) WM_NAME)
	# WM_NAME=$(xprop -id $(xdotool getactivewindow) WM_NAME | cut -d '=' -f 2 | awk -F\" '{ print $2 }')

	if [ $WM_CLASS == 'firefox' ]; then

		echo "%{F$white} Firefox%{u-}"
	
  elif [[ $WM_NAMER == *"$term"* ]]; then

		echo "%{F$white}$WM_CLASS%{u-}"

  elif [ $WM_NAME == 'ranger' ]; then

		echo "%{F$white}Ranger%{u-}"

  elif [[ $WM_CLASS == *"$gimp"* ]]; then

		echo "%{F$white}GNU Image Manipulation Program%{u-}"
	# elif [ $WM_NAME == 'Enter WM_NAME value here' ]; then

	# 	echo "%{F#ffffff}Custom name%{u-}"

	else

		echo "%{F$white}$WM_NAME%{u-}"

	fi

fi
