#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define the path for Sinden scripts
SINDEN_SCRIPTS_PATH="/media/fat/Scripts/Sinden"

echo "Downloading the latest MiSTerSindenDriver version."

# Remove deprecated old Lightgun folder if it exists
if [ -d "/media/fat/Lightgun" ]; then
    echo "Deprecated /media/fat/Lightgun folder found. Deleting..."
    rm -rf /media/fat/Lightgun
fi

# Remove deprecated SindenLightgun folder if it exists
if [ -d "/media/fat/SindenLightgun" ]; then
    echo "/media/fat/SindenLightgun folder found. Deleting..."
    rm -rf /media/fat/SindenLightgun
fi

# Create and navigate to the Sinden directory
mkdir -p $SINDEN_SCRIPTS_PATH
cd $SINDEN_SCRIPTS_PATH

# Inform the user to wait until the download is done
echo "Please wait while the latest version is being downloaded..."
# Download Sinden files on MiSTer using MrFusion 2.7
wget -O main.zip https://github.com/MrLightgun/MiSTerSindenDriver/archive/refs/heads/main.zip

# Inform the user to wait until the unzip is done
echo "Please wait while the files are being unzipped..."
unzip -oq main.zip
echo "Files have been unzipped."

# Navigate to the downloaded directory
cd MiSTerSindenDriver-main

echo "Starting MiSTerSindenDriver setup."
source ./Setup_SindenLightgunDriver.sh
echo "Finished MiSTerSindenDriver setup."

# Delete the first install Install_SindenLightgunDriver.sh file
if [ -f "/media/fat/Scripts/Install_SindenLightgunDriver.sh" ]; then
    echo "Deleting Install_SindenLightgunDriver.sh..."
    rm -f /media/fat/Scripts/Install_SindenLightgunDriver.sh
fi

# Delete the downloaded main.zip file
if [ -f "$SINDEN_SCRIPTS_PATH/main.zip" ]; then
    echo "Deleting Sinden/main.zip..."
    rm -f $SINDEN_SCRIPTS_PATH/main.zip
fi

# Print success message and inform the user about the reboot
echo "Install Successful. Your MiSTer will reboot in 5 seconds to complete the installation."
sleep 5
echo "Rebooting now..."
reboot