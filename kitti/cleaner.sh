#!/bin/bash
# This script was written by Mohammed Chaouki ZIARA, 
# For Ph.D. Project @ RCAM Laboratory, Djilali Liabes University - Algeria 
# It is used to unzip and clean the KITTI dataset.
# Contact: medchaoukiziara@gmail.com || me@chaouki.pro


# ----------------------------------------------------------
# This Bash script automates the extraction and cleanup of the KITTI 
# dataset by unzipping all .zip files in a specified directory (images). 
# After extraction, it deletes the original zip files and removes any non-PNG files 
# within the extracted directories. The script uses GNU Parallel to process 
# multiple zip files concurrently, improving efficiency.
# ----------------------------------------------------------


# Ensure GNU Parallel is installed
if ! command -v parallel &> /dev/null; then
    echo "GNU Parallel is not installed. Please install it and try again."
    exit 1
fi

# Set the base directory
BASE_DIR="images"

# Function to process each zip file
process_zip() {
    local zip_file="$1"
    local dir="${zip_file%.zip}"

    # Extract the zip file
    unzip -q "$zip_file" -d "$dir"

    # Check if unzip was successful before deleting the zip file
    if [ $? -eq 0 ]; then
        # Remove the original zip file right after extraction
        rm "$zip_file"
    else
        echo "Failed to unzip $zip_file"
    fi

    # Find and delete all files that are not .png inside the extracted directory
    find "$dir" -type f ! -name "*.png" -delete
}

export -f process_zip

# Loop through all zip files in the base directory and process them in parallel
find "$BASE_DIR" -name "*.zip" | parallel process_zip


# Function to extract and remove zip files
extract_and_remove_zips() {
    local extract_dir="$1"

    # Find all zip files in the directory
    zip_files=($(find "$extract_dir" -type f -name "*.zip"))

    if [ ${#zip_files[@]} -eq 0 ]; then
        echo "No zip files found in $extract_dir."
        return
    fi

    for zip_file in "${zip_files[@]}"; do
        echo "Extracting $zip_file to $extract_dir"
        unzip -q "$zip_file" -d "$extract_dir"
        echo "Removing $zip_file"
        rm "$zip_file"
    done
}

# Extract and remove all zip files in the depths folder
extract_and_remove_zips "depths"

echo "Download, extraction, cleanup, and zip file deletion completed."
