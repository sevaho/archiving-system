#!/bin/bash
i=0


while [ $i -lt 59 ]; do

#vara=`date | cut -d " " -f4 | tr -d :`

if [ "$(ls -A /var/www/html/uploads)" ]; then

jaar=`cat /var/www/html/uploads/details | cut -d " " -f1`
klas=`cat /var/www/html/uploads/details | cut -d " " -f2`
naam=`cat /var/www/html/uploads/details | cut -d " " -f3`

ssh vagrant@192.168.56.15 "mkdir -p /home/vagrant/files/$jaar/$klas/$naam"
scp -r /var/www/html/uploads/* vagrant@192.168.56.15:/home/vagrant/files/$jaar/$klas/$naam/
rm -rf /var/www/html/uploads/*
ssh vagrant@192.168.56.15 "rm -rf /home/vagrant/files/$jaar/$klas/$naam/details"

else
echo ""   
fi


  sleep 1
  i=$(( i + 1 ))


done
