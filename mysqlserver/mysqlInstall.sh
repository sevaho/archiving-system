#!/bin/env bash

echo 'Going to install mysql on your machine'
echo '------------------------'
sleep 1s

#hostname
echo "mysqlserver" > /etc/hostname

#selinux

 #installation
yum -y install mariadb-server mariadb mysql mysql-server wget git zip unzip nano links nmap

#services
systemctl start mariadb
systemctl enable mariadb.service

#firewall
systemctl restart firewalld.service
firewall-cmd --add-service=mysql
firewall-cmd --add-service=mysql --permanent
firewall-cmd --reload

#commands
cp -r /home/vagrant/scriptsVagrant/* /home/vagrant/
chmod +x /home/vagrant/databaseGranters.sh
chmod +x /home/vagrant/builddatabase.sh
mkdir -p /home/vagrant/builddatabase
chmod 777 /home/vagrant/builddatabase
sudo /home/vagrant/databaseGranters.sh root root root123
nmap 127.0.0.1

echo 'Okay.... mariadb is installed.'
echo; echo; echo;
echo "mysql password set to root";
