#!/bin/env bash

echo 'Going to install gitlabserver on your machine'
echo '------------------------'
sleep 1s

#hostname
echo "gitlabserver" > /etc/hostname


#installation

yum -y install nmap wget httpd php rkhunter nmap php-mysql php-fpm wget git zip unzip nano curl policycoreutils openssh-server openssh-clients  postfix
wget http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
rpm -ivh epel-release-6-8.noarch.rpm

#selinux
setsebool -P httpd_can_network_connect=1
setsebool -P httpd_read_user_content=1
setsebool -P httpd_unified=1
setsebool -P httpd_execmem=1
setsebool -P httpd_sys_script_anon_write=1
#setenforce 0

#services
sudo systemctl enable sshd
sudo systemctl start sshd
sudo systemctl enable postfix
sudo systemctl start postfix

#firewalld

sudo firewall-cmd --permanent --add-service=http
sudo systemctl reload firewalld

#services

#commands
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
 yum -y install gitlab-ce

curl -LJO https://packages.gitlab.com/gitlab/gitlab-ce/packages/el/7/gitlab-ce-XXX.rpm/download
rpm -i gitlab-ce-XXX.rpm

gitlab-ctl reconfigure
nmap 127.0.0.1

echo 'Okay.... gitolite is installed.'
echo; echo; echo;
