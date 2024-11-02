#!/bin/bash

# Ask if you want to encode .mkv or .mp4 files
read -p "Encode .mkv or .mp4 files? [mkv/mp4]: " extension
extension=${extension:-mkv}

# Validate input and set file extension
case "${extension,,}" in # Convert to lowercase for comparison
    "mkv")
        echo "Encoding .mkv files"
        ;;
    "mp4")
        echo "Encoding .mp4 files"
        ;;
    *)
        echo "Invalid extension. Please use mkv or mp4. Exiting..."
        exit 1
        ;;
esac

# Check if any files with the chosen extension exist
if ! ls *."$extension" >/dev/null 2>&1; then
    echo "No .$extension files found in current directory. Exiting..."
    exit 1
fi

# Select encoding preset
echo "Select encoding preset:"
echo "1) AV1 (High compression, slower encoding)"
echo "2) x265 (Good compression, moderate encoding speed)"
echo "3) x264 (Fast encoding, moderate compression)"
read -p "Choose preset [1-3]: " preset

# Process each file
for input_file in *."$extension"; do
    echo "Processing: ${input_file%.*}"
    
    case "$preset" in
        # NOTE: All videos will be encoded into .mkv format
        1)
            output_file="${input_file%.*}-aomav1crf40cpu8.mkv"
            ffmpeg -hide_banner -i "$input_file" \
                   -c:v libaom-av1 -crf 40 -cpu-used 8 \
                   -c:a copy "$output_file"
            ;;
        2)
            output_file="${input_file%.*}-x265crf26med.mkv"
            ffmpeg -hide_banner -i "$input_file" \
                   -c:v libx265 -preset medium -crf 26 \
                   -c:a copy "$output_file"
            ;;
        3)
            output_file="${input_file%.*}-x264crf27med.mkv"
            ffmpeg -hide_banner -i "$input_file" \
                   -c:v libx264 -preset medium -crf 27 \
                   -c:a aac "$output_file"
            ;;
        *)
            echo "Invalid preset selection. Exiting..."
            exit 1
            ;;
    esac
    
    if [ $? -eq 0 ]; then
        echo "Successfully finished processing: ${input_file%.*}"
    else
        echo "Error processing: ${input_file%.*}"
    fi
done

echo "All files processed!"
