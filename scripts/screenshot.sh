#!/bin/bash
folder="/home/${USER}/Pictures/Screenshots"
timestamp=$(date +%Y%m%d%H%M%S)
filename="screenshot_$timestamp.png"
save_path="$folder/$filename"

if [ -z $(which scrot) ]; then
    echo "scrot is not installed on your system, please install it first"
    exit 1
fi

if [ ! -d $folder ]; then
    mkdir -p $folder
fi

scrot -u "$save_path"

echo "Screenshot saved $save_path"
notify-send "Screenshot save $save_path"
