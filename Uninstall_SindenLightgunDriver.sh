#!/bin/bash

# Define the path for Sinden scripts and MiSTer config
SINDEN_SCRIPTS_PATH="/media/fat/Scripts/Sinden"
MISTER_CONFIG_PATH="/media/fat/config"

# Uninstall script for MiSTerSindenDriver

# Remove custom cores with "Sinden" in their name
sudo rm -f /media/fat/_Console/*_Sinden_*.rbf

# Check if /usr/lib is writable and remove libraries if they exist (to be deprecated later)
if [ -w /usr/lib ]; then
    sudo rm -f /usr/lib/libcairo.so.2
    sudo rm -f /usr/lib/libexif.so.12
    sudo rm -f /usr/lib/libfontconfig.so.1
    sudo rm -f /usr/lib/libgssapi_krb5.so.2
    sudo rm -f /usr/lib/libk5crypto.so.3
    sudo rm -f /usr/lib/libkeyutils.so.1
    sudo rm -f /usr/lib/libkrb5.so.3
    sudo rm -f /usr/lib/libkrb5support.so.0
    sudo rm -f /usr/lib/libpixman-1.so.0
fi

# Restore original kernel
if [ -f /media/fat/linux/zImage_dtb_backup ]; then
  sudo cp -f /media/fat/linux/zImage_dtb_backup /media/fat/linux/zImage_dtb
  sudo rm -f /media/fat/linux/zImage_dtb_backup
fi

# Restore original MiSTer binary
if [ -f /media/fat/MiSTer_orig ]; then
  sudo cp -f /media/fat/MiSTer_orig /media/fat/MiSTer
  sudo chmod u+x /media/fat/MiSTer
  sudo rm -f /media/fat/MiSTer_orig
fi

# Remove configs
sudo rm -f $MISTER_CONFIG_PATH/ATARI7800.CFG
sudo rm -f $MISTER_CONFIG_PATH/Genesis.CFG
sudo rm -f $MISTER_CONFIG_PATH/MegaCD.CFG
sudo rm -f $MISTER_CONFIG_PATH/MegaDrive.CFG
sudo rm -f $MISTER_CONFIG_PATH/NES.CFG
sudo rm -f $MISTER_CONFIG_PATH/PSX.CFG
sudo rm -f $MISTER_CONFIG_PATH/SMS.CFG
sudo rm -f $MISTER_CONFIG_PATH/SNES.CFG

# Remove input maps
sudo rm -f $MISTER_CONFIG_PATH/inputs/ATARI7800_input_16c0_0f01_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/ATARI7800_input_16c0_0f02_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/ATARI7800_input_16c0_0f38_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/ATARI7800_input_16c0_0f39_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/Genesis_input_16c0_0f01_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/Genesis_input_16c0_0f02_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/Genesis_input_16c0_0f38_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/Genesis_input_16c0_0f39_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/input_16c0_0f01_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/input_16c0_0f02_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/input_16c0_0f38_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/input_16c0_0f39_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/MegaCD_input_16c0_0f01_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/MegaCD_input_16c0_0f02_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/MegaCD_input_16c0_0f38_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/MegaCD_input_16c0_0f39_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/MegaDrive_input_16c0_0f01_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/MegaDrive_input_16c0_0f02_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/MegaDrive_input_16c0_0f38_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/MegaDrive_input_16c0_0f39_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/NES_input_16c0_0f01_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/NES_input_16c0_0f02_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/NES_input_16c0_0f38_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/NES_input_16c0_0f39_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/PSX_input_16c0_0f01_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/PSX_input_16c0_0f02_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/PSX_input_16c0_0f38_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/PSX_input_16c0_0f39_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/SMS_input_16c0_0f01_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/SMS_input_16c0_0f02_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/SMS_input_16c0_0f38_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/SMS_input_16c0_0f39_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/SNES_input_16c0_0f01_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/SNES_input_16c0_0f02_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/SNES_input_16c0_0f38_v3.map
sudo rm -f $MISTER_CONFIG_PATH/inputs/SNES_input_16c0_0f39_v3.map

# Remove downloaded and extracted files
sudo rm -rf $SINDEN_SCRIPTS_PATH/MiSTerSindenDriver-main
sudo rm -f $SINDEN_SCRIPTS_PATH/main.zip

# Remove the Sinden directory
sudo rm -rf $SINDEN_SCRIPTS_PATH

# Remove deprecated Lightgun folder if it exists
if [ -d "/media/fat/Lightgun" ]; then
    echo "Deprecated /media/fat/Lightgun folder found. Deleting..."
    sudo rm -rf /media/fat/Lightgun
fi

# Remove SindenLightgun folder
if [ -d "/media/fat/SindenLightgun" ]; then
    echo "/media/fat/SindenLightgun folder found. Deleting..."
    sudo rm -rf /media/fat/SindenLightgun
fi

# Remove startup scripts
sudo rm -f /media/fat/Scripts/SindenLightgunStart_Default.sh
sudo rm -f /media/fat/Scripts/SindenLightgunStart_LowResource.sh
sudo rm -f /media/fat/Scripts/SindenLightgunStart_MaxResource.sh
sudo rm -f /media/fat/Scripts/SindenLightgunStop.sh

echo "MiSTerSindenDriver uninstallation completed. Please reboot your MiSTer."