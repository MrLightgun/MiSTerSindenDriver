#!/bin/bash

# Define the path for Sinden scripts and MiSTer config
SINDEN_SCRIPTS_PATH="/media/fat/Scripts/Sinden"
MISTER_CONFIG_PATH="/media/fat/config"

# Uninstall script for MiSTerSindenDriver

# Remove custom cores with "Sinden" in their name
rm -f /media/fat/_Console/*_Sinden_*.rbf

# Check if /usr/lib is writable and remove libraries if they exist (to be deprecated later)
if [ -w /usr/lib ]; then
    rm -f /usr/lib/libcairo.so.2
    rm -f /usr/lib/libexif.so.12
    rm -f /usr/lib/libfontconfig.so.1
    rm -f /usr/lib/libgssapi_krb5.so.2
    rm -f /usr/lib/libk5crypto.so.3
    rm -f /usr/lib/libkeyutils.so.1
    rm -f /usr/lib/libkrb5.so.3
    rm -f /usr/lib/libkrb5support.so.0
    rm -f /usr/lib/libpixman-1.so.0
fi

# Restore original kernel
if [ -f /media/fat/linux/zImage_dtb_backup ]; then
  cp -f /media/fat/linux/zImage_dtb_backup /media/fat/linux/zImage_dtb
  rm -f /media/fat/linux/zImage_dtb_backup
fi

# Restore original MiSTer binary
if [ -f /media/fat/MiSTer_orig ]; then
  cp -f /media/fat/MiSTer_orig /media/fat/MiSTer
  chmod u+x /media/fat/MiSTer
  rm -f /media/fat/MiSTer_orig
fi

# Remove configs
rm -f $MISTER_CONFIG_PATH/ATARI7800.CFG
rm -f $MISTER_CONFIG_PATH/Genesis.CFG
rm -f $MISTER_CONFIG_PATH/MegaCD.CFG
rm -f $MISTER_CONFIG_PATH/MegaDrive.CFG
rm -f $MISTER_CONFIG_PATH/NES.CFG
rm -f $MISTER_CONFIG_PATH/PSX.CFG
rm -f $MISTER_CONFIG_PATH/SMS.CFG
rm -f $MISTER_CONFIG_PATH/SNES.CFG

# Remove input maps
rm -f $MISTER_CONFIG_PATH/inputs/ATARI7800_input_16c0_0f01_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/ATARI7800_input_16c0_0f02_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/ATARI7800_input_16c0_0f38_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/ATARI7800_input_16c0_0f39_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/Genesis_input_16c0_0f01_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/Genesis_input_16c0_0f02_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/Genesis_input_16c0_0f38_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/Genesis_input_16c0_0f39_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/input_16c0_0f01_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/input_16c0_0f02_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/input_16c0_0f38_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/input_16c0_0f39_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/MegaCD_input_16c0_0f01_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/MegaCD_input_16c0_0f02_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/MegaCD_input_16c0_0f38_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/MegaCD_input_16c0_0f39_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/MegaDrive_input_16c0_0f01_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/MegaDrive_input_16c0_0f02_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/MegaDrive_input_16c0_0f38_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/MegaDrive_input_16c0_0f39_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/NES_input_16c0_0f01_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/NES_input_16c0_0f02_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/NES_input_16c0_0f38_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/NES_input_16c0_0f39_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/PSX_input_16c0_0f01_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/PSX_input_16c0_0f02_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/PSX_input_16c0_0f38_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/PSX_input_16c0_0f39_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SMS_input_16c0_0f01_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SMS_input_16c0_0f02_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SMS_input_16c0_0f38_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SMS_input_16c0_0f39_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SNES_input_16c0_0f01_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SNES_input_16c0_0f02_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SNES_input_16c0_0f38_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SNES_input_16c0_0f39_v3.map

# Remove downloaded and extracted files
rm -rf $SINDEN_SCRIPTS_PATH/MiSTerSindenDriver-main
rm -f $SINDEN_SCRIPTS_PATH/main.zip

# Remove the Sinden directory
rm -rf $SINDEN_SCRIPTS_PATH

# Remove deprecated Lightgun folder if it exists
if [ -d "/media/fat/Lightgun" ]; then
    echo "Deprecated /media/fat/Lightgun folder found. Deleting..."
    rm -rf /media/fat/Lightgun
fi

# Remove SindenLightgun folder
if [ -d "/media/fat/SindenLightgun" ]; then
    echo "/media/fat/SindenLightgun folder found. Deleting..."
    rm -rf /media/fat/SindenLightgun
fi

# Remove startup scripts
rm -f /media/fat/Scripts/SindenLightgunStart_Default.sh
rm -f /media/fat/Scripts/SindenLightgunStart_LowResource.sh
rm -f /media/fat/Scripts/SindenLightgunStart_MaxResource.sh
rm -f /media/fat/Scripts/SindenLightgunStop.sh

# Delete the first install Install_SindenLightgunDriver.sh file
if [ -f "/media/fat/Scripts/Install_SindenLightgunDriver.sh" ]; then
    echo "Deleting Install_SindenLightgunDriver.sh..."
    rm -f /media/fat/Scripts/Install_SindenLightgunDriver.sh
fi

echo "MiSTerSindenDriver uninstallation completed. Please reboot your MiSTer."
# Ask the user if they want to reboot the machine
read -p Uninstall Successful. Do you want to reboot the machine? (Y/N): " -n 1 -r
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Rebooting the machine..."
    reboot
else
    echo "Reboot cancelled. Script completed successfully."
fi