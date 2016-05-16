#!/bin/env bash

start_seconds="$(date +%s)"

echo 'Going to install the LAMP stack on your machine'
echo '------------------------'
sleep 1s

#hostname
echo "lampserver" > /etc/hostname

#installation
yum -y install httpd php rkhunter nmap php-mysql php-fpm wget git zip unzip nano

#selinux
setsebool -P httpd_can_network_connect=1
setsebool -P httpd_read_user_content=1
setsebool -P httpd_unified=1
setsebool -P httpd_execmem=1
setsebool -P httpd_sys_script_anon_write=1
#setenforce 0

#services

systemctl restart httpd.service
systemctl enable httpd.service

#firewalld

systemctl restart firewalld.service
firewall-cmd --add-service=http
firewall-cmd --add-port=80/tcp
firewall-cmd --add-service=http --permanent
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --reload

#services
systemctl restart httpd.service

#commands
\cp -rf /home/vagrant/public_html/. /var/www/html/
\cp -rf /home/vagrant/scriptsVagrant/. /home/vagrant/

chmod +x /home/vagrant/checkForFilesToSendToFS.sh
chmod +x /home/vagrant/sendFilesFromFSToBS.sh
chmod +x /home/vagrant/sendSQLToMysqlserver.sh
chmod +x /home/vagrant/ssh/ssh.sh

mkdir -p /var/www/html/uploads
mkdir -p /var/www/html/filetobuild
mkdir -p /var/www/html/sqluploads

chmod 777 /var/www/html/uploads
chmod 777 /var/www/html/filetobuild
chmod 777 /var/www/html/sqluploads
sed -i -e 's/upload_max_filesize = 2M/upload_max_filesize = 20M/g' /etc/php.ini

echo "*/1 * * * * /home/vagrant/checkForFilesToSendToFS.sh" > /var/spool/cron/root
echo "*/1 * * * * /home/vagrant/sendFilesFromFSToBS.sh" >> /var/spool/cron/root
echo "*/1 * * * * /home/vagrant/sendSQLToMysqlserver.sh" >> /var/spool/cron/root

nmap 127.0.0.1


end_seconds="$(date +%s)"

echo "Okay.... apache and php is installed in "$(expr $end_seconds - $start_seconds)" seconds"
echo; echo; echo;
echo "check for rootkits with rkhunter --check"
echo "run ./home/vagrant/ssh/ssh.sh to ssh connect to the fileserver passw: vagrant"
