#!/bin/bash

echo "Downloading the latest MiSTerSindenDriver version."

# Download Sinden files on MiSTer using MrFusion 2.7
sudo mkdir -p /media/fat/Lightgun
cd /media/fat/Lightgun
sudo wget -O main.zip https://github.com/MrLightgun/MiSTerSindenDriver/archive/refs/heads/main.zip
sudo unzip -o main.zip
cd /media/fat/Lightgun/MiSTerSindenDriver-main
echo "Starting MiSTerSindenDriver setup."
sudo chmod +x Setup_MrFusion.sh
./Setup_MrFusion.sh