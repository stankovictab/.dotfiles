#!/bin/bash

# Startup Script

# Ideal keyboard polling speed
# First is the delay, second is repeating speed
# https://askubuntu.com/a/1014269
# xset r rate 220 35

# Changing mouse speed
# It goes from -1 to 1
# KDE has it's own mouse setting, this screws that up
# if [ "$(neofetch wm | tail -c 6)" != 'KWin ' ]
# then
#	notify-send "hi"
# 	xinput --set-prop 8 'libinput Accel Speed' -0.6
# fi

# xbindkeys

# Old mouse scroll on side click
# xinput set-prop 11 "libinput Scroll Method Enabled" 0, 0, 1
# xinput set-prop 11 "libinput Button Scrolling Button" 8
