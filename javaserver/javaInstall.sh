#!/bin/env bash
start_seconds="$(date +%s)"
echo 'Going to install the java stack on your machine'
echo '------------------------'
sleep 1s

#hostname
echo "javaserver" > /etc/hostname

#selinux


#installation

yum -y install httpd java-1.8.0-openjdk-devel tomcat tomcat-webapps tomcat-admin-webapps nano nmap


#services

systemctl restart httpd.service
systemctl enable httpd.service
systemctl restart tomcat
systemctl start mariadb
systemctl enable mariadb.service

#firewalld

systemctl restart firewalld.service
firewall-cmd --add-service=http
firewall-cmd --add-port=80/tcp
firewall-cmd --add-service=mysql
firewall-cmd --zone=public --add-port=8080/tcp
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --reload

systemctl restart httpd.service

\cp -rf /home/vagrant/java/. /usr/share/tomcat/webapps/
\cp -rf /home/vagrant/mysqlconnectorVagrant/. /usr/share/tomcat/lib/
chmod 777 /usr/share/tomcat/webapps/
nmap 127.0.0.1

end_seconds="$(date +%s)"

echo "Okay.... tomcat server configured in "$(expr $end_seconds - $start_seconds)" seconds"
echo; echo; echo;
echo "mysql password set to root";
echo "check for rootkits with rkhunter --check"
