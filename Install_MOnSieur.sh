#Download Sinden files on MOnSieurFPGA Feb 2022 release
sudo mkdir /home/alarm/Lightgun
cd /home/alarm/Lightgun
sudo wget https://github.com/MrLightgun/MiSTerSindenDriver/archive/refs/heads/main.zip
sudo unzip main.zip
cd /home/alarm/Lightgun/MiSTerSindenDriver-main
sudo chmod +x *.sh
./Setup_MrFusion.sh
