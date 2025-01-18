#!/bin/bash

for file in Screenshot_*.png; do
    if [[ $file =~ Screenshot_([0-9]{4})([0-9]{2})([0-9]{2})_([0-9]{2})([0-9]{2})([0-9]{2}).png ]]; then
        year="${BASH_REMATCH[1]}"
        month="${BASH_REMATCH[2]}"
        day="${BASH_REMATCH[3]}"
        hour="${BASH_REMATCH[4]}"
        minute="${BASH_REMATCH[5]}"
        second="${BASH_REMATCH[6]}"
        
        new_name="${year}-${month}-${day}_${hour}-${minute}-${second}.png"
        mv "$file" "$new_name"
        echo "Renamed: $file -> $new_name"
    fi
done
