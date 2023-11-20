
#copy custom cores that have Sinden border built in
cd /media/fat/Lightgun/MiSTerSindenDriver-main/Cores
sudo mkdir /media/fat/_Console/
sudo cp -p *.rbf /media/fat/_Console/
sudo chmod 755 /media/fat/_Console/*.rbf

#copy startup scripts to easily start and stop the lightgun
cd /media/fat/Lightgun/MiSTerSindenDriver-main/StartupScripts
sudo cp *.sh /media/fat/scripts
sudo chmod +x /media/fat/scripts/*.sh

#copy lightgun driver
cd /media/fat/Lightgun/MiSTerSindenDriver-main/LightgunDriver
sudo cp *.* /media/fat/Lightgun/
sudo cp LightgunDriver /media/fat/Lightgun/LightgunDriver
mkdir /media/fat/usr/lib
ln -s /media/fat/usr/lib /usr/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/media/fat/Lightgun
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib

#copy tweaked kernel
cd /media/fat/Lightgun/MiSTerSindenDriver-main/Kernel/MiSTerFPGA/MrFusion2.7/
sudo cp /media/fat/linux/zImage_dtb /media/fat/linux/zImage_dtb_backup
sudo cp zImage_dtb /media/fat/linux/zImage_dtb

#now update MiSTer to be able to read the Sinden lightgun joystick
cd /media/fat/Lightgun/MiSTerSindenDriver-main/MiSTerUpdate
sudo cp /media/fat/MiSTer /media/fat/MiSTer_orig
#need to close MiSTer on the front end

sudo cp MiSTer /media/fat/MiSTer
sudo chmod u+x /media/fat/MiSTer


