#!/bin/bash

# Name the monitor/video output being changed
video_output="Virtual1"

# Define resolution
resolutionX="1900"
resolutionY="900"

# Get resolution information for xrandr
mode_info=$(cvt $resolutionX $resolutionY | awk '{print $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13}' | tail -n +2)
mode_name=$(echo $mode_info | awk '{print $1}')

# Change resolution
echo "Creating $mode_name resolution..."
xrandr --newmode $mode_info
xrandr --addmode $video_output $mode_name
echo "Changing resolution..."
xrandr --output $video_output --mode $mode_name
echo "Resolution changed."

exit 0