#This script will replace the /etc/ssh/ssh_config

#Updating the entire "Database." Not sure why this is required, but lets do it anyways
updatedb
#Deletes previous files and replaces the ssh_config file with secured file
sudo chattr -i /etc/ssh/ssh_config
sudo chmod 777 /etc/ssh/ssh_config
#sudo cp -TRv ssh_config_mod /etc/ssh/ssh_config
#cat PWD$/ssh_config_mod > /etc/ssh/ssh_config
#/usr/bin/sshd -t

#Keys
find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec chown root:root {}
\;
find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec chmod 0600 {} \;
find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec chmod 0644 {}
\;
find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec chown
root:root {} \;

sudo systemctl restart sshd.service 
#this service command will serve as a backup command in case systemctil does not work
sudo service ssh restart

