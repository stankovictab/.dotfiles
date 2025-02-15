#!/bin/bash

# Used in zjstatus (among possibly many other things in the future)

# Print tailscale icon and color it if it's running

if ! systemctl status tailscaled.service | grep running > /dev/null
then
    echo "#[fg=#33354f]" # Off
else
    if ! tailscale status | grep stopped > /dev/null
    then
        echo "#[fg=#26baff]" # On, and connected
    else
        echo "#[fg=#a15927]" # On, but not connected
    fi
fi
