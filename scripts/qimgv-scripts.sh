#!/bin/bash

# This script handles qimgv scripts for image/video manipulation
# Here's how a standard qimgv script command looks like
# "/home/stankovictab/scripts/qimgv-scripts.sh" %file% myArgument
# The output directory will be the same as the directory of the file

# NOTE: "$1" is the actual file, and it needs to be in quotes to prevent word splitting in bash if the image has a space in the name, therefore "$2" and so on are arguments

# -------------------------------------

TERMINAL="flatpak run org.wezfurlong.wezterm -e" # alacritty -e also works

# -------------------------------------
convert_image() {
    # local input="$1"
    local output_filename
    output_filename=$(basename "$2")
    local conversion_command="$3"
    
    notify-send "Converting image to ${output_filename}"
    eval "$conversion_command" # Running the command
}

copy_to_special() {
    mkdir -p "Special"
    cp "$1" "Special"
    notify-send "Copied file to Special folder."
}

upscaler_run() {
    notify-send "Upscaling image..."
    # The upscaler will upscale the image and place the output into the Upscaled/ folder
    $TERMINAL "/home/stankovictab/Desktop/upscaler/upscale.sh" "$1"
}

# -------------------------------------

# Check if file argument is provided
if [ -z "$1" ]; then
    notify-send "Error: No file specified"
    exit 1
fi

# Process arguments
case "$2" in
    --copy-to-special) # Tied to "s" shortcut
        copy_to_special "$1"
        ;;
    --upscale) # Tied to "u" shortcut
        upscaler_run "$1"
        ;;
    --av1-crf19) # Tied to "d" shortcut
        convert_image "$1" "${1%.*}-crf19cpu8.avif" "ffmpeg -i \"$1\" -c:v libaom-av1 -cpu-used 8 -crf 19 \"${1%.*}-crf19cpu8.avif\""
        ;;
    --av1-crf25) # Tied to "a" shortcut
        convert_image "$1" "${1%.*}-crf25cpu8.avif" "ffmpeg -i \"$1\" -c:v libaom-av1 -cpu-used 8 -crf 25 \"${1%.*}-crf25cpu8.avif\""
        ;;
    --webp) # Tied to "w" shortcut
        convert_image "$1" "${1%.*}-q88cl6.webp" "ffmpeg -i \"$1\" -c:v libwebp -quality 88 -compression_level 6 \"${1%.*}-q88cl6.webp\""
        ;;
    --jxl) # Tied to "j" shortcut
        convert_image "$1" "${1%.*}-eff7dist1.jxl" "ffmpeg -i \"$1\" -c:v libjxl -effort 7 -distance 1 \"${1%.*}-eff7dist1.jxl\""
        ;;
    --jpg) # Tied to "b" shortcut
        convert_image "$1" "${1%.*}.jpg" "ffmpeg -i \"$1\" \"${1%.*}.jpg\""
        ;;
    --png) # Tied to "g" shortcut
        convert_image "$1" "${1%.*}.png" "ffmpeg -i \"$1\" \"${1%.*}.png\""
        ;;
    *)
        notify-send "Error: Unknown argument $2"
        exit 1
        ;;
esac
