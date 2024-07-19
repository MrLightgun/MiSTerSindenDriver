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

# Create and navigate to the Sinden directory
mkdir -p $SINDEN_SCRIPTS_PATH
cd $SINDEN_SCRIPTS_PATH

# Download Sinden files on MiSTer using MrFusion 2.7
wget -O main.zip https://github.com/Matt-Retrogamer/MiSTerSindenDriver/archive/refs/heads/main.zip
unzip -o main.zip

# Navigate to the downloaded directory
cd MiSTerSindenDriver-main

echo "Starting MiSTerSindenDriver setup."
./Setup_SindenLightgunDriver.sh
echo "Finished MiSTerSindenDriver setup."

# Delete the first install Install_SindenLightgunDriver.sh file
if [ -f "/media/fat/Scripts/Install_SindenLightgunDriver.sh" ]; then
    echo "Deleting Install_SindenLightgunDriver.sh..."
    rm -f /media/fat/Scripts/Install_SindenLightgunDriver.sh
fi

# Ask the user if they want to reboot the machine
read -p "Install Successful. Do you want to reboot the machine? (Y/N): " -n 1 -r
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Rebooting the machine..."
    reboot
else
    echo "Reboot cancelled. Script completed successfully."
fi