#!/bin/bash

xbindkeys

# lpf
userString="$(stat --format '%U' ~/Documents/Private)"
if [ "$userString" = "root" ] 
then
	echo "Already locked!"
else 
	pkexec sudo chown root:root ~/Documents/Private
	echo "Locked!"
fi

# Old mouse scroll on side click
xinput set-prop 11 "libinput Scroll Method Enabled" 0, 0, 1
xinput set-prop 11 "libinput Button Scrolling Button" 8
