#!/bin/env bash

echo 'Going to install monoserver on your machine'
echo '------------------------'
sleep 1s

#hostname
echo "monoserver" > /etc/hostname

#selinux

#installation
apt-get -y install nano nmap

#services

#systemctl restart httpd.service
#systemctl enable httpd.service

#firewalld

systemctl restart firewalld.service
#firewall-cmd --add-service=http
#firewall-cmd --add-port=80/tcp
#firewall-cmd --add-service=http --permanent
#firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --reload

#services
#systemctl restart httpd.service

#commands
nmap 127.0.0.1

echo 'Okay.... monoserver is installed.'
echo; echo; echo;
