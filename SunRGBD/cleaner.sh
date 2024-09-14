#!/bin/bash
# This script was written by Mohammed Chaouki ZIARA, 
# For Ph.D. Project @ RCAM Laboratory, Djilali Liabes University - Algeria 
# It is used to unzip and clean the SUNRGBD dataset.
# Contact: medchaoukiziara@gmail.com || me@chaouki.pro


# ----------------------------------------------------------
# This Bash script automates the extraction and cleanup of SUNRGBD dataset 
# dataset by unzipping all .zip files in a specified directory (images).  
# After extraction, it deletes the original zip files and removes any non-PNG files 
# ----------------------------------------------------------

# Get the directory where the script is located
script_dir="$(dirname "$0")"

# Iterate through all .zip files in the script directory
for zip_file in "$script_dir"/*.zip; do
    # Check if the .zip file exists
    if [ -f "$zip_file" ]; then        
        # Extract the .zip file
        unzip "$zip_file"
        
        # Check if the unzip was successful
        if [ $? -eq 0 ]; then
            # Remove the .zip file after successful extraction
            rm "$zip_file"
            echo "Successfully extracted and removed $zip_file."
        else
            echo "Failed to extract $zip_file."
        fi
    else
        echo "No .zip files found in $script_dir."
    fi
done

