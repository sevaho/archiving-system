#!/bin/bash
i=0


while [ $i -lt 59 ]; do

#vara=`date | cut -d " " -f4 | tr -d :`

if [ "$(ls -A /var/www/html/sqluploads)" ]; then
dbname=`cat /var/www/html/sqluploads/dbnamefile | cut -d " " -f1`
file0=""

ls /var/www/html/sqluploads/ > /var/www/html/sqluploads/sqlfile
sqlfilevar=`cat /var/www/html/sqluploads/sqlfile  | grep .sql`
scp /var/www/html/sqluploads/* vagrant@192.168.56.13:/home/vagrant/builddatabase/
rm -rf /var/www/html/sqluploads/*

if [ "$sqlfilevar" == "$file0" ]
then
echo ""
else
ssh vagrant@192.168.56.13 "/home/vagrant/builddatabase.sh $dbname $sqlfilevar"
ssh vagrant@192.168.56.13 "rm -rf /home/vagrant/builddatabase/*"
fi
else
echo ""
fi


  sleep 1
  i=$(( i + 1 ))


done
