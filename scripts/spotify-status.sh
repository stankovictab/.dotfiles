#!/bin/bash

# Used in zjstatus (among possibly many other things in the future)

# Print artist and song only if something is playing

status=$(playerctl -p spotify metadata --format '{{ artist }} - {{ title }}') 

if [ -z "$status" ]
then
    exit
else
    echo "$status" | cut -c1-38 # You can turn down this cutoff for a smaller output, to prevent zjstatus disappearing
fi
