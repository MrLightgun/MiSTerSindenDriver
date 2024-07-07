#!/bin/bash

# Uninstall script for MiSTerSindenDriver

# Remove custom cores with "Sinden" in their name
sudo rm -f /media/fat/_Console/*_Sinden_*.rbf

# Remove startup scripts
sudo rm -f /media/fat/scripts/LightgunStart-Default.sh
sudo rm -f /media/fat/scripts/LightgunStart-LowResource.sh
sudo rm -f /media/fat/scripts/LightgunStart-MaxResource.sh
sudo rm -f /media/fat/scripts/LightgunStop.sh

# Remove lightgun driver and associated files
sudo rm -f /media/fat/Lightgun/libcairo.so.2
sudo rm -f /media/fat/Lightgun/libexif.so.12
sudo rm -f /media/fat/Lightgun/libfontconfig.so.1
sudo rm -f /media/fat/Lightgun/libgssapi_krb5.so.2
sudo rm -f /media/fat/Lightgun/libk5crypto.so.3
sudo rm -f /media/fat/Lightgun/libkeyutils.so.1
sudo rm -f /media/fat/Lightgun/libkrb5.so.3
sudo rm -f /media/fat/Lightgun/libkrb5support.so.0
sudo rm -f /media/fat/Lightgun/libpixman-1.so.0
sudo rm -f /media/fat/Lightgun/LightgunDriver
sudo rm -f /media/fat/Lightgun/LightgunMono.exe.config
sudo rm -f /media/fat/Lightgun/readme.txt

# Remove libraries copied to /usr/lib
sudo rm -f /usr/lib/libcairo.so.2
sudo rm -f /usr/lib/libexif.so.12
sudo rm -f /usr/lib/libfontconfig.so.1
sudo rm -f /usr/lib/libgssapi_krb5.so.2
sudo rm -f /usr/lib/libk5crypto.so.3
sudo rm -f /usr/lib/libkeyutils.so.1
sudo rm -f /usr/lib/libkrb5.so.3
sudo rm -f /usr/lib/libkrb5support.so.0
sudo rm -f /usr/lib/libpixman-1.so.0

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
sudo rm -f /media/fat/config/ATARI7800.CFG
sudo rm -f /media/fat/config/Genesis.CFG
sudo rm -f /media/fat/config/MegaCD.CFG
sudo rm -f /media/fat/config/MegaDrive.CFG
sudo rm -f /media/fat/config/NES.CFG
sudo rm -f /media/fat/config/PSX.CFG
sudo rm -f /media/fat/config/SMS.CFG
sudo rm -f /media/fat/config/SNES.CFG

# Remove input maps
sudo rm -f /media/fat/config/inputs/ATARI7800_input_16c0_0f01_v3.map
sudo rm -f /media/fat/config/inputs/ATARI7800_input_16c0_0f02_v3.map
sudo rm -f /media/fat/config/inputs/ATARI7800_input_16c0_0f38_v3.map
sudo rm -f /media/fat/config/inputs/ATARI7800_input_16c0_0f39_v3.map
sudo rm -f /media/fat/config/inputs/Genesis_input_16c0_0f01_v3.map
sudo rm -f /media/fat/config/inputs/Genesis_input_16c0_0f02_v3.map
sudo rm -f /media/fat/config/inputs/Genesis_input_16c0_0f38_v3.map
sudo rm -f /media/fat/config/inputs/Genesis_input_16c0_0f39_v3.map
sudo rm -f /media/fat/config/inputs/input_16c0_0f01_v3.map
sudo rm -f /media/fat/config/inputs/input_16c0_0f02_v3.map
sudo rm -f /media/fat/config/inputs/input_16c0_0f38_v3.map
sudo rm -f /media/fat/config/inputs/input_16c0_0f39_v3.map
sudo rm -f /media/fat/config/inputs/MegaCD_input_16c0_0f01_v3.map
sudo rm -f /media/fat/config/inputs/MegaCD_input_16c0_0f02_v3.map
sudo rm -f /media/fat/config/inputs/MegaCD_input_16c0_0f38_v3.map
sudo rm -f /media/fat/config/inputs/MegaCD_input_16c0_0f39_v3.map
sudo rm -f /media/fat/config/inputs/MegaDrive_input_16c0_0f01_v3.map
sudo rm -f /media/fat/config/inputs/MegaDrive_input_16c0_0f02_v3.map
sudo rm -f /media/fat/config/inputs/MegaDrive_input_16c0_0f38_v3.map
sudo rm -f /media/fat/config/inputs/MegaDrive_input_16c0_0f39_v3.map
sudo rm -f /media/fat/config/inputs/NES_input_16c0_0f01_v3.map
sudo rm -f /media/fat/config/inputs/NES_input_16c0_0f02_v3.map
sudo rm -f /media/fat/config/inputs/NES_input_16c0_0f38_v3.map
sudo rm -f /media/fat/config/inputs/NES_input_16c0_0f39_v3.map
sudo rm -f /media/fat/config/inputs/PSX_input_16c0_0f01_v3.map
sudo rm -f /media/fat/config/inputs/PSX_input_16c0_0f02_v3.map
sudo rm -f /media/fat/config/inputs/PSX_input_16c0_0f38_v3.map
sudo rm -f /media/fat/config/inputs/PSX_input_16c0_0f39_v3.map
sudo rm -f /media/fat/config/inputs/SMS_input_16c0_0f01_v3.map
sudo rm -f /media/fat/config/inputs/SMS_input_16c0_0f02_v3.map
sudo rm -f /media/fat/config/inputs/SMS_input_16c0_0f38_v3.map
sudo rm -f /media/fat/config/inputs/SMS_input_16c0_0f39_v3.map
sudo rm -f /media/fat/config/inputs/SNES_input_16c0_0f01_v3.map
sudo rm -f /media/fat/config/inputs/SNES_input_16c0_0f02_v3.map
sudo rm -f /media/fat/config/inputs/SNES_input_16c0_0f38_v3.map
sudo rm -f /media/fat/config/inputs/SNES_input_16c0_0f39_v3.map

# Remove downloaded and extracted files
sudo rm -rf /media/fat/Lightgun/MiSTerSindenDriver-main
sudo rm -f /media/fat/Lightgun/main.zip

# Remove the Lightgun directory
sudo rm -rf /media/fat/Lightgun

echo "Uninstallation complete. Please reboot your MiSTer."