#!/bin/bash
# This script was written by Mohammed Chaouki ZIARA, 
# For Ph.D. Project @ RCAM Laboratory, Djilali Liabes University - Algeria 
# Used to download the DIODE dataset  (rgb images and the depth maps).
# Contact: medchaoukiziara@gmail.com || me@chaouki.pro

bash ./downloader.sh

# Check if the first script completed successfully
if [ $? -eq 0 ]; then
    # Run the second script (cleaner.sh)
    bash ./cleaner.sh
    
    # Check if the second script completed successfully
    if [ $? -eq 0 ]; then
        echo "The process of downloading and cleaning the data was successful!"
    else
        echo "The cleaning process failed after a successful download!"
    fi
else
    echo "The download process failed. The script used to extract and clean the data will NOT RUN!"
fi
