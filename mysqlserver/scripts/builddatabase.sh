#!/bin/bash

mysql -uroot -proot -bse "create database if not exists $1";
mysql -uroot -proot --database=$1 < /home/vagrant/builddatabase/$2
rm -rf  /home/vagrant/builddatabase/$2
