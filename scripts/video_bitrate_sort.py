# Usage: 
# cd /run/media/stankovictab/Black Pearl/Recordings
# python ~/scripts/video_bitrate_sort.py > video_bitrate_sort.txt

# NOTE: The videos that are erroring out where they can't process the duration,
# usually means that the OBS recording was corrupted and not stopped properly
# (it's the issue where pressing on Stop Recording fails and you need to kill OBS)
# So this is a good way to find those videos and reencode them to fi the issue

import os
import subprocess
import json
from pathlib import Path

def format_duration(duration):
    """Format duration in seconds to HH:MM:SS"""
    if duration is None:
        return "N/A"
    hours = int(duration // 3600)
    minutes = int((duration % 3600) // 60)
    seconds = int(duration % 60)
    return f"{hours:02d}:{minutes:02d}:{seconds:02d}"

def get_video_duration(file_path):
    """Get video duration using ffprobe"""
    try:
        cmd = [
            'ffprobe',
            '-v', 'quiet',
            '-print_format', 'json',
            '-show_format',
            str(file_path)
        ]
        result = subprocess.run(cmd, capture_output=True, text=True)
        data = json.loads(result.stdout)
        return float(data['format']['duration'])
    except Exception as e:
        print(f"Error processing {file_path}: {str(e)}")
        return None

def calculate_bitrate(file_path):
    """Calculate bitrate (file size / duration)"""
    duration = get_video_duration(file_path)
    if duration:
        size_bytes = os.path.getsize(file_path)
        size_bits = size_bytes * 8
        bitrate = size_bits / duration  # bits per second
        return bitrate, duration
    return None, None

def format_bitrate(bitrate):
    """Format bitrate to human-readable format"""
    if bitrate is None:
        return "N/A"
    mbps = bitrate / 1_000_000
    return f"{mbps:.2f} Mbps"

def main():
    # Get all video files recursively
    video_files = []
    for ext in ['.mkv', '.mp4']:
        video_files.extend(Path('.').rglob(f'*{ext}'))

    # Calculate bitrates and store results
    results = []
    for file_path in video_files:
        bitrate, duration = calculate_bitrate(file_path)
        if bitrate:
            results.append((file_path, bitrate, duration))

    # Sort by bitrate (highest first)
    results.sort(key=lambda x: x[1], reverse=True)

    # Print results
    print("\n^ The errored videos can be reencoded with ffmpeg to fix the OBS corruption issue ^")
    print("\nVideo Bitrate Analysis:")
    print("-" * 100)
    print(f"{'File Path':<60} {'Bitrate':>10} {'Duration':>12}")
    print("-" * 100)
    
    for file_path, bitrate, duration in results:
        print(f"{str(file_path):<60} {format_bitrate(bitrate):>10} {format_duration(duration):>12}")

if __name__ == "__main__":
    main()
