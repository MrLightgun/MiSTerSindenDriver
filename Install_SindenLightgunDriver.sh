#!/bin/bash

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
wget -O main.zip https://github.com/MrLightgun/MiSTerSindenDriver/archive/refs/heads/main.zip
unzip -o main.zip

# Navigate to the downloaded directory
cd MiSTerSindenDriver-main

echo "Starting MiSTerSindenDriver setup."
./Setup_SindenLightgunDriver.sh
