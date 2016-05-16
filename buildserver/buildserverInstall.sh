#!/bin/env bash

echo 'Going to install buildserver on your machine'
echo '------------------------'
sleep 1s

#hostname
echo "buildserver" > /etc/hostname

#selinux

 #installation
yum -y install wget git zip unzip nano links nmap maven gcc make

#services


#firewall
systemctl restart firewalld.service
firewall-cmd --reload


#commands
nmap 127.0.0.1
mkdir -p /home/vagrant/tobuild
cp -rf /home/vagrant/scriptsVagrant/* /home/vagrant/
chmod +x /home/vagrant/ssh/ssh.sh
chmod +x /home/vagrant/tomcatbuild.sh
mkdir -p /home/vagrant/tobuild
chmod 777 /home/vagrant/tobuild

echo "*/1 * * * * /home/vagrant/tomcatbuild.sh" >> /var/spool/cron/root

echo 'Okay.... buildserver is installed.'
echo; echo; echo;
