#!/bin/bash

# Used in zjstatus (among possibly many other things in the future)

# Print syncthing icon and color it if it's running

if ! systemctl --user status syncthing | grep running > /dev/null
then
    echo "#[fg=#63554d]"
else
    echo "#[fg=#ff955c]" # 󰓦
fi
