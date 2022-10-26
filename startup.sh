#!/bin/bash

# Ideal keyboard polling speed
# First is the delay, second is repeating speed
# https://askubuntu.com/a/1014269
xset r rate 220 35

# Changing mouse speed
# It goes from -1 to 1
# Comment when on KDE
xinput --set-prop 8 'libinput Accel Speed' -0.6

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
# xinput set-prop 11 "libinput Scroll Method Enabled" 0, 0, 1
# xinput set-prop 11 "libinput Button Scrolling Button" 8
