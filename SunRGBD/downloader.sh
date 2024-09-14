#!/bin/bash
# This script was written by Mohammed Chaouki ZIARA, 
# For Ph.D. Project @ RCAM Laboratory, Djilali Liabes University - Algeria 
# Used to download the SUNRGBD dataset  (rgb images and depth maps).
# Contact: medchaoukiziara@gmail.com || me@chaouki.pro


echo "START DOWNLOADING SUN-RGBD DATASET FOR DEPTH ESTIMATION TASK"
echo "The official website of the SUNRGBD Dataset : https://rgbd.cs.princeton.edu/ "

# Get the directory where the script is located
SCRIPT_DIR="$(dirname "$(realpath "$0")")"


# URLs of the files to download
url="https://rgbd.cs.princeton.edu/data/SUNRGBD.zip"  # Replace with the actual URL of the data file


# Extract the filenames from the URLs
filename1=$(basename "$url")

# Download the first file
echo "Downloading $filename1..."
wget -O "$SCRIPT_DIR/$filename1" "$url"
if [ $? -eq 0 ]; then
    echo "$filename1 downloaded successfully"
    file1_status=1
else
    echo "Failed to download $filename1"
    file1_status=0
fi
