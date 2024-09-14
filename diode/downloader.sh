#!/bin/bash
# This script was written by Mohammed Chaouki ZIARA, 
# For Ph.D. Project @ RCAM Laboratory, Djilali Liabes University - Algeria 
# Used to download the DIODE dataset  (rgb images and depth maps).
# Contact: medchaoukiziara@gmail.com || me@chaouki.pro


echo "START DOWNLOADING DIODE DATASET FOR DEPTH ESTIMATION TASK"
echo "The official website of the DIODE Dataset : https://diode-dataset.org/ "


# Get the directory where the script is located
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

# Create the 'data' directory in the script location
mkdir -p "$SCRIPT_DIR/data"

# URLs of the files to download
valurl="http://diode-dataset.s3.amazonaws.com/val.tar.gz"             # Replace with the actual URL of the validation data
trainurl="http://diode-dataset.s3.amazonaws.com/train.tar.gz"         # Replace with the actual URL of the traininf   data


# Extract the filenames from the URLs
filename1=$(basename "$valurl")
filename2=$(basename "$trainurl")

# Download the first file
echo "Downloading $filename1..."
wget -O "$SCRIPT_DIR/data/$filename1" "$valurl"
if [ $? -eq 0 ]; then
    echo "$filename1 downloaded successfully"
    file1_status=1
else
    echo "Failed to download $filename1"
    file1_status=0
fi

# Download the second file
echo "Downloading $filename2..."
wget -O "$SCRIPT_DIR/data/$filename2" "$trainurl"
if [ $? -eq 0 ]; then
    echo "$filename2 downloaded successfully"
    file2_status=1
else
    echo "Failed to download $filename2"
    file2_status=0
fi

# Show the final message based on download success
if [ $file1_status -eq 1 ] && [ $file2_status -eq 1 ]; then
    echo "Both files downloaded successfully."
elif [ $file1_status -eq 0 ] && [ $file2_status -eq 0 ]; then
    echo "Both $filename1 and $filename2 downloads failed."
elif [ $file1_status -eq 1 ]; then
    echo "$filename1 downloaded successfully, but $filename2 download failed."
else
    echo "$filename2 downloaded successfully, but $filename1 download failed."
fi
