#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define the path for Sinden scripts
SINDEN_SCRIPTS_PATH="/media/fat/Scripts/Sinden"

# Copy custom cores and mgl files that have Sinden border built in
#cd $SINDEN_SCRIPTS_PATH/MiSTerSindenDriver-main/Cores
mkdir -p /media/fat/Light\ Gun/
cp -f *.rbf /media/fat/Light\ Gun/
chmod 755 /media/fat/Light\ Gun/*.rbf
echo "Moved Sinden Core Files."

cd $SINDEN_SCRIPTS_PATH/MiSTerSindenDriver-main/mgl
mkdir -p /media/fat/_Console/
cp -f *.mgl /media/fat/_Console/
chmod 755 /media/fat/_Console/*.mgl
echo "Moved Sinden mgl Files."

# Copy startup scripts to easily start and stop the lightgun
cd $SINDEN_SCRIPTS_PATH/MiSTerSindenDriver-main/StartupScripts
cp -f *.sh /media/fat/Scripts

# Copy tweaked kernel
cd $SINDEN_SCRIPTS_PATH/MiSTerSindenDriver-main/Kernel/MiSTerFPGA/MrFusion2.7/
cp -f /media/fat/linux/zImage_dtb /media/fat/linux/zImage_dtb_backup
cp -f zImage_dtb /media/fat/linux/zImage_dtb


# Copy over configs to setup lightgun as joystick correctly on MiSTer menu and in cores
mkdir -p /media/fat/config/inputs
cp -f $SINDEN_SCRIPTS_PATH/MiSTerSindenDriver-main/Config/*.* /media/fat/config
cp -f $SINDEN_SCRIPTS_PATH/MiSTerSindenDriver-main/Config/inputs/*.* /media/fat/config/inputs
echo "Moved Sinden CFG Files."

echo "Setup complete. Please reboot the MiSTer to apply changes."