#!/bin/bash
echo "==================================================================="
echo " This script was written by Mohammed Chaouki ZIARA"
echo " For Ph.D. Project @ RCAM Laboratory, Djilali Liabes University - Algeria"
echo " Used to download depth estimation dataset (RGB images and depth maps)."
echo " Currently supports downloading Kitti, DIODE, SunRGBD (others coming ASAP)."
echo ""
echo " Contact: medchaoukiziara@gmail.com || me@chaouki.pro"
echo " Please make sure to install GNU Parallel to speed up the process of cleaning the Kitti dataset."
echo "==================================================================="
echo ""

# Function to run the main.sh script in a given folder
run_main_in_folder() {
    folder_name=$1

    # Check if main.sh exists in the folder
    if [ -f "$folder_name/main.sh" ]; then
        echo "Working on $folder_name Dataset"

        # Save the current working directory
        current_dir=$(pwd)

        # Change to the target folder and run main.sh
        cd "$folder_name" || exit
        bash ./main.sh

        # Return to the original directory
        cd "$current_dir" || exit
    else
        echo "No main.sh found in $folder_name"
    fi
}

# Check if any folder names were passed as arguments
if [ $# -gt 0 ]; then
    # Iterate over the passed folder names
    for folder_name in "$@"; do
        # Check if the folder exists
        if [ -d "$folder_name" ]; then
            run_main_in_folder "$folder_name"
        else
            echo "Folder $folder_name does not exist!"
        fi
    done
else
    # If no arguments were passed, run main.sh in all subdirectories
    for folder_name in */; do
        run_main_in_folder "$folder_name"
    done
fi
