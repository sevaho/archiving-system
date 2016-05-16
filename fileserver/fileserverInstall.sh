#!/bin/env bash

echo 'Going to install fileserver on your machine'
echo '------------------------'
sleep 1s

#hostname
echo "fileserver" > /etc/hostname

#selinux

 #installation
yum -y install wget git zip unzip nano links nmap tree

#services


#firewall
systemctl restart firewalld.service
firewall-cmd --reload


#commands
\cp -rf /home/vagrant/scriptsVagrant/. /home/vagrant/
chmod +x /home/vagrant/sendFilesToBS.sh
chmod +x /home/vagrant/ssh/ssh.sh
touch /home/vagrant/filestotransfer
mkdir /home/vagrant/files
chmod 777 /home/vagrant/files
chmod 777 /home/vagrant/filestotransfer
nmap 127.0.0.1

echo "*/1 * * * * /home/vagrant/sendFilesToBS.sh" >> /var/spool/cron/root

echo 'Okay.... filserver is installed.'
echo; echo; echo;
echo "run ./home/vagrant/ssh/ssh.sh passwd vagrant"
