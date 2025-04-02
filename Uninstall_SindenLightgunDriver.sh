#!/bin/bash

# Define the path for Sinden scripts and MiSTer config
SINDEN_SCRIPTS_PATH="/media/fat/Scripts/Sinden"
MISTER_CONFIG_PATH="/media/fat/config"

# Uninstall script for MiSTerSindenDriver

# Remove custom cores with "Sinden" in their name
rm -rf /media/fat/Light\ Gun
rm -f /media/fat/_Console/Atari\ 7800\ Light\ Gun.mgl
rm -f /media/fat/_Utility/InputTest\ Light\ Gun.mgl
rm -f /media/fat/_Console/NES\ Light\ Gun.mgl
rm -f /media/fat/_Console/Playstation\ Light\ Gun\ \(Dual\ Ram\).mgl
rm -f /media/fat/_Console/Playstation\ Light\ Gun.mgl
rm -f /media/fat/_Console/SEGA\ Genesis\ Light\ Gun.mgl
rm -f /media/fat/_Console/SEGA\ Master\ System\ Light\ Gun.mgl
rm -f /media/fat/_Console/SEGA\ Mega\ Drive\ Light\ Gun.mgl
rm -f /media/fat/_Console/SEGA\ Mega-CD\ Light\ Gun.mgl
rm -f /media/fat/_Console/SEGA\ Saturn\ Light\ Gun\ \(Dual\ Ram\).mgl
rm -f /media/fat/_Console/SEGA\ Saturn\ Light\ Gun.mgl
rm -f /media/fat/_Console/Super\ Nintendo\ Light\ Gun.mgl

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
rm -f $MISTER_CONFIG_PATH/Atari\ 7800\ Light\ Gun.CFG
rm -f $MISTER_CONFIG_PATH/NES\ Light\ Gun.CFG
rm -f $MISTER_CONFIG_PATH/PSX\ Light\ Gun\ \(Dual\ Ram\).CFG
rm -f $MISTER_CONFIG_PATH/Playstation\ Light\ Gun.CFG
rm -f $MISTER_CONFIG_PATH/SEGA\ Saturn\ Light\ Gun\ \(Dual\ Ram\).CFG
rm -f $MISTER_CONFIG_PATH/SEGA\ Saturn\ Light\ Gun.CFG
rm -f $MISTER_CONFIG_PATH/SEGA\ Genesis\ Light\ Gun.CFG
rm -f $MISTER_CONFIG_PATH/SEGA\ Master\ System\ Light\ Gun.CFG
rm -f $MISTER_CONFIG_PATH/SEGA\ Mega\ Drive\ Light\ Gun.CFG
rm -f $MISTER_CONFIG_PATH/SEGA\ Mega-CD\ Light\ Gun.CFG
rm -f $MISTER_CONFIG_PATH/Super\ Nintendo\ Light\ Gun.CFG

# Remove input maps
rm -f $MISTER_CONFIG_PATH/inputs/Atari\ 7800\ Light\ Gun_input_16c0_0f02_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/Atari\ 7800\ Light\ Gun_input_16c0_0f38_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/Atari\ 7800\ Light\ Gun_input_16c0_0f39_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/Atari\ 7800\ Light\ Gun_input_16c0_0f01_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/InputTest\ Light\ Gun_16c0_0f01_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/InputTest\ Light\ Gun_16c0_0f02_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/InputTest\ Light\ Gun_16c0_0f38_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/InputTest\ Light\ Gun_16c0_0f39_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/NES\ Light\ Gun_input_16c0_0f01_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/NES\ Light\ Gun_input_16c0_0f02_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/NES\ Light\ Gun_input_16c0_0f38_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/NES\ Light\ Gun_input_16c0_0f39_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/PSX\ Light\ Gun\ \(Dual\ Ram\)_input_16c0_0f01_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/PSX\ Light\ Gun\ \(Dual\ Ram\)_input_16c0_0f02_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/PSX\ Light\ Gun\ \(Dual\ Ram\)_input_16c0_0f38_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/PSX\ Light\ Gun\ \(Dual\ Ram\)_input_16c0_0f39_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/Playstation\ Light\ Gun_input_16c0_0f01_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/Playstation\ Light\ Gun_input_16c0_0f02_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/Playstation\ Light\ Gun_input_16c0_0f38_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/Playstation\ Light\ Gun_input_16c0_0f39_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SEGA\ Genesis\ Light\ Gun_input_16c0_0f01_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SEGA\ Genesis\ Light\ Gun_input_16c0_0f02_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SEGA\ Genesis\ Light\ Gun_input_16c0_0f38_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SEGA\ Genesis\ Light\ Gun_input_16c0_0f39_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SEGA\ Master\ System\ Light\ Gun_input_16c0_0f01_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SEGA\ Master\ System\ Light\ Gun_input_16c0_0f02_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SEGA\ Master\ System\ Light\ Gun_input_16c0_0f38_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SEGA Master System Light Gun_input_16c0_0f39_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SEGA\ Mega\ Drive\ Light\ Gun_input_16c0_0f01_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SEGA\ Mega\ Drive\ Light\ Gun_input_16c0_0f02_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SEGA\ Mega\ Drive\ Light\ Gun_input_16c0_0f38_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SEGA Mega Drive Light Gun_input_16c0_0f39_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SEGA\ Mega-CD\ Light\ Gun_input_16c0_0f01_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SEGA\ Mega-CD\ Light\ Gun_input_16c0_0f02_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SEGA\ Mega-CD\ Light\ Gun_input_16c0_0f38_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/SEGA\ Mega-CD\ Light\ Gun_input_16c0_0f39_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/Super\ Nintendo\ Light\ Gun_16c0_0f01_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/Super\ Nintendo\ Light\ Gun_16c0_0f02_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/Super\ Nintendo\ Light\ Gun_16c0_0f38_v3.map
rm -f $MISTER_CONFIG_PATH/inputs/Super\ Nintendo\ Light\ Gun_16c0_0f39_v3.map

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

# Remove deprecated SindenLightgun folder if it exists
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