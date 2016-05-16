#!/bin/bash

#mysql -u$1 -p$2 -bse
mysql -u$1 -p$2 mysql -bse "create user 'lampserver'@'192.168.56.10' identified by '$3';"
mysql -u$1 -p$2 mysql -bse "create user 'javaserver'@'192.168.56.11' identified by  '$3';"

mysql -u$1 -p$2 mysql -bse "grant all privileges on *.* to 'lampserver'@'192.168.56.10' with grant option;"
mysql -u$1 -p$2 mysql -bse "grant all privileges on *.* to 'javaserver'@'192.168.56.11' with grant option;"

mysql -u$1 -p$2 mysql -bse "FLUSH PRIVILEGES;"
