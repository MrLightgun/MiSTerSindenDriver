
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
cd /media/fat/Lightgun/MiSTerSindenDriver-main/StartupScripts
sudo cp *.* /media/fat/Lightgun

#copy tweaked kernel
cd /media/fat/Lightgun/MiSTerSindenDriver-main/Kernel/MOnSieurFPGA/28thFeb2022/
sudo cp /boot/linux/zImage_dtb /boot/linux/zImage_dtb_backup
#sudo cp zImage_dtb /boot/linux/zImage_dtb

#now update MiSTer to be able to read the Sinden lightgun joystick
cd /media/fat/Lightgun/MiSTerSindenDriver-main/MiSTerUpdate
sudo cp /usr/bin/MiSTer /usr/bin/MiSTer_orig
#need to close MiSTer on the front end

#sudo cp MiSTer /usr/bin/MiSTer
#sudo chmod u+x /usr/bin/MiSTer


