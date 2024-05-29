#!/bin/bash

# Used in zjstatus (among possibly many other things in the future)

# Check if the kubectl command exists
if command -v kubectl &> /dev/null; then
    # If kubectl exists, get the current context and extract the last field using awk
    current_context=$(kubectl config current-context | awk -F'/' '{print $NF}')
    
    # Check if the output is "Not Connected"
    if [ "$current_context" = "Not Connected" ]; then
        echo "Not Connected"
    else
        echo "$current_context"
    fi
else
    echo "no kube"
fi




