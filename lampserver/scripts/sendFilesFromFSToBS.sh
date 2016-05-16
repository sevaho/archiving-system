#!/bin/bash

i=0


while [ $i -lt 59 ]; do

#vara=`date | cut -d " " -f4 | tr -d :`

if [ "$(ls -A /var/www/html/filetobuild)" ]; then

jaar=`cat /var/www/html/filetobuild/filetobuildfile | cut -d " " -f1`
klas=`cat /var/www/html/filetobuild/filetobuildfile | cut -d " " -f2`
naam=`cat /var/www/html/filetobuild/filetobuildfile | cut -d " " -f3`
file=`cat /var/www/html/filetobuild/filetobuildfile | cut -d " " -f4`

ssh vagrant@192.168.56.15 "echo "/home/vagrant/files/$jaar/$klas/$naam/$file" >> /home/vagrant/filestotransfer"
rm -rf /var/www/html/filetobuild/*

else
echo ""
fi


  sleep 1
  i=$(( i + 1 ))


done
