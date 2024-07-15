#!/bin/bash

echo "Downloading the latest MiSTerSindenDriver version."

# Remove deprecated old Lightgun folder if it exists
if [ -d "/media/fat/Lightgun" ]; then
    echo "Deprecated /media/fat/Lightgun folder found. Deleting..."
    sudo rm -rf /media/fat/Lightgun
fi

# Create and navigate to the Sinden directory
sudo mkdir -p /media/fat/Scripts/Sinden
cd /media/fat/Scripts/Sinden

# Download Sinden files on MiSTer using MrFusion 2.7
# sudo wget -O main.zip https://github.com/MrLightgun/MiSTerSindenDriver/archive/refs/heads/main.zip
sudo wget -O main.zip https://github.com/Matt-Retrogamer/MiSTerSindenDriver/archive/refs/heads/main.zip
sudo unzip -o main.zip

# Navigate to the downloaded directory
cd MiSTerSindenDriver-main

echo "Starting MiSTerSindenDriver setup."
./Setup_SindenLightgunDriver.sh