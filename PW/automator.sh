#Automates all the scripts in the directory
sudo apt-get -y install libpam-pwquality
sudo ./lightdm.sh
sudo ./rootpwchange.sh
sudo ./sysctl.sh

