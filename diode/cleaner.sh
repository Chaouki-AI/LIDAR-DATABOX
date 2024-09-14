#!/bin/bash
# This script was written by Mohammed Chaouki ZIARA, 
# For Ph.D. Project @ RCAM Laboratory, Djilali Liabes University - Algeria 
# It is used to unzip and clean the KITTI dataset.
# Contact: medchaoukiziara@gmail.com || me@chaouki.pro


# ----------------------------------------------------------
# This Bash script automates the extraction and cleanup of the DIODE dataset 
# dataset by unzipping all .zip files in a specified directory (images). 
# After extraction, it deletes the original zip files and removes any non-PNG files 
# ----------------------------------------------------------


# Set the directory where the script is located and data folder
SCRIPT_DIR="$(dirname "$(realpath "$0")")"
DATA_DIR="$SCRIPT_DIR/data"

# Function to extract, clean files, and remove the tar.gz
process_data() {
    local tar_file=$1
    local folder=$2
    
    # Check if the tar.gz file exists
    if [ -f "$tar_file" ]; then
        echo "Extracting $tar_file..."
        
        # Create the folder if it doesn't exist
        # mkdir -p "$folder"
        
        # Extract tar.gz file into the specified folder (train/val)
        tar -xzf "$tar_file" -C "$folder"
        
        # Ensure only .npy files ending with "mask.npy" are removed
        find "$folder" -type f -name "*mask.npy" -exec rm -f {} \;
        
        # Remove the tar.gz file after extraction
        rm -f "$tar_file"
        
        echo "$tar_file extracted, cleaned, and tar.gz file removed"
        return 1
    else
        echo "No tar.gz file found for $tar_file"
        return 0
    fi
}

# Process train.tar.gz
process_data "$DATA_DIR/train.tar.gz" "$DATA_DIR"
train_status=$?

# Process val.tar.gz
process_data "$DATA_DIR/val.tar.gz" "$DATA_DIR"
val_status=$?

# Clear the screen and show the final message based on extraction success

if [ $train_status -eq 1 ] && [ $val_status -eq 1 ]; then
    echo "All data (Images and Depth maps) for train and validation extracted, cleaned, and tar.gz files removed successfully."
elif [ $train_status -eq 0 ] && [ $val_status -eq 0 ]; then
    echo "No tar.gz files found for both train and validation."
elif [ $train_status -eq 1 ]; then
    echo "Train data processed successfully, but no tar.gz file found for validation."
else
    echo "Validation data processed successfully, but no tar.gz file found for train."
fi

