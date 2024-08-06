#!/bin/bash

# Used in zjstatus (among possibly many other things in the future)

# Check if the kubectl command exists
if command -v kubectl &> /dev/null; then
    # If kubectl exists, get the current context and extract the last field using awk
    # Redirect stderr to stdout so we can capture the error message if any
    current_context=$(kubectl config current-context 2>&1 | awk -F'/' '{print $NF}')

    # Check if the output is "Not Connected" or contains an error message
    if [ "$current_context" = "Not Connected" ] || [[ "$current_context" == *"error"* ]]; then
        echo "not-connected"
    else
        echo "$current_context"
    fi
else
    echo "not-installed"
fi
