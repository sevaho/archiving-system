#How to monitor servers (linux)

##GoAcces


GoAccess is an open source real-time web log analyzer and interactive viewer that runs in a terminal 
in *nix systems. It provides fast and valuable HTTP statistics for system administrators that require a visual server report on the fly.


``` bash

# yum -y install goacces

```

modify /etc/goacces.conf 

remove # at:


``` bash

time-format %H:%M:%S
date-format %d/%b/%Y
log-format %h %^[%d:%t %^] "%r" %s %b "%R" "%u"


then do:

goaccess -f /var/log/httpd/access_log > /var/www/html/report.html


```

go to ip-addr/report.html



##Zabbix

Zabbix is a monitoring tool which is widely used in all kinds of environments. Zabbix is very flexible, information can be retrieved using HTTP/SNMP or by installing a Zabbix agent on the machines to monitor, and allows a lot of customization. Unfortunately this also means that the learning curve can be rather high. This post will go a little deeper into the installation process and the first steps in Zabbix.

[zabbix 3.0.0 beta](http://jensd.be/731/linux/install-the-zabbix-3-0-0-beta-from-source-on-centos-or-rhel)
[zabbix current](http://jensd.be/393/linux/install-zabbix-on-centos-7-or-rhel-7)
[zabbix tecmint guide](http://www.tecmint.com/install-and-configure-zabbix-monitoring-on-debian-centos-rhel/)
##Monitorix

Monitorix is an open source, free and most powerful lightweight tool designed to monitor system and network resources in Linux. It regularly collects system and network data and display the information in graphs using its own web interface. Monitorix allows to monitor overall system performance and also help in detecting bottlenecks, failures, unwanted long response times and other abnormal activities.

[Tecmint - Monitorix](http://www.tecmint.com/monitorix-a-lightweight-system-and-network-monitoring-tool-for-linux/)

##Cacti

Cacti tool is an open source web based network monitoring and system monitoring graphing solution for IT business. Cacti enables a user to poll services at regular intervals to create graphs on resulting data using RRDtool. Generally, it is used to graph time-series data of metrics such as network bandwidth utilization, CPU load, running processes, disk space etc.

[Tecmint - Cacti](http://www.tecmint.com/install-cacti-network-monitoring-on-rhel-centos-6-3-5-8-and-fedora-17-12/)

##Ajenti

	
Ajenti is an open source web based system management control panel for managing remote system administrating tasks from the web browser much similar to Webmin module. Ajenti is a much powerful and lightweight tool, that provides fast and responsive web interface for managing small server set-ups and also best suitable for VPS and Dedicated servers. It has built with many pre-made plugins for configuring and monitoring server software’s and services such as Apache, Cron, File System, Firewall, MySQL, Nginx, Munin, Samba, FTP, Squid and many other tools like File Manager, Code Editor for developers and Terminal access.

[Tecmint - Ajenti](http://www.tecmint.com/install-ajenti-a-web-based-control-panel-for-managing-linux-server/)

##Netdata

netdata is a extremely optimized Linux utility that provides real-time (per second) performance monitoring for Linux systems, applications, SNMP devices, etc. and shows full interactive charts that absolutely render all collected values over the web browser to analyze them.

[Tecmint - Netdata](http://www.tecmint.com/netdata-real-time-linux-performance-network-monitoring-tool/)

##Script to monitor server

``` bash

 ####################################################################################################
                  #                                        Tecmint_monitor.sh                                        #
                  # Written for Tecmint.com for the post www.tecmint.com/linux-server-health-monitoring-script/      #
                  # If any bug, report us in the link below                                                          #
                  # Free to use/edit/distribute the code below by                                                    #
                  # giving proper credit to Tecmint.com and Author                                                   #
                  #                                                                                                  #
                  ####################################################################################################
#! /bin/bash
# unset any variable which system may be using

# clear the screen
clear

unset tecreset os architecture kernelrelease internalip externalip nameserver loadaverage

while getopts iv name
do
        case $name in
          i)iopt=1;;
          v)vopt=1;;
          *)echo "Invalid arg";;
        esac
done

if [[ ! -z $iopt ]]
then
{
wd=$(pwd)
basename "$(test -L "$0" && readlink "$0" || echo "$0")" > /tmp/scriptname
scriptname=$(echo -e -n $wd/ && cat /tmp/scriptname)
su -c "cp $scriptname /usr/bin/monitor" root && echo "Congratulations! Script Installed, now run monitor Command" || echo "Installation failed"
}
fi

if [[ ! -z $vopt ]]
then
{
echo -e "tecmint_monitor version 0.1\nDesigned by Tecmint.com\nReleased Under Apache 2.0 License"
}
fi

if [[ $# -eq 0 ]]
then
{


# Define Variable tecreset
tecreset=$(tput sgr0)

# Check if connected to Internet or not
ping -c 1 google.com &> /dev/null && echo -e '\E[32m'"Internet: $tecreset Connected" || echo -e '\E[32m'"Internet: $tecreset Disconnected"

# Check OS Type
os=$(uname -o)
echo -e '\E[32m'"Operating System Type :" $tecreset $os

# Check OS Release Version and Name
cat /etc/os-release | grep 'NAME\|VERSION' | grep -v 'VERSION_ID' | grep -v 'PRETTY_NAME' > /tmp/osrelease
echo -n -e '\E[32m'"OS Name :" $tecreset  && cat /tmp/osrelease | grep -v "VERSION" | cut -f2 -d\"
echo -n -e '\E[32m'"OS Version :" $tecreset && cat /tmp/osrelease | grep -v "NAME" | cut -f2 -d\"

# Check Architecture
architecture=$(uname -m)
echo -e '\E[32m'"Architecture :" $tecreset $architecture

# Check Kernel Release
kernelrelease=$(uname -r)
echo -e '\E[32m'"Kernel Release :" $tecreset $kernelrelease

# Check hostname
echo -e '\E[32m'"Hostname :" $tecreset $HOSTNAME

# Check Internal IP
internalip=$(hostname -I)
echo -e '\E[32m'"Internal IP :" $tecreset $internalip

# Check External IP
externalip=$(curl -s ipecho.net/plain;echo)
echo -e '\E[32m'"External IP : $tecreset "$externalip

# Check DNS
nameservers=$(cat /etc/resolv.conf | sed '1 d' | awk '{print $2}')
echo -e '\E[32m'"Name Servers :" $tecreset $nameservers 

# Check Logged In Users
who>/tmp/who
echo -e '\E[32m'"Logged In users :" $tecreset && cat /tmp/who 

# Check RAM and SWAP Usages
free -h | grep -v + > /tmp/ramcache
echo -e '\E[32m'"Ram Usages :" $tecreset
cat /tmp/ramcache | grep -v "Swap"
echo -e '\E[32m'"Swap Usages :" $tecreset
cat /tmp/ramcache | grep -v "Mem"

# Check Disk Usages
df -h| grep 'Filesystem\|/dev/sda*' > /tmp/diskusage
echo -e '\E[32m'"Disk Usages :" $tecreset 
cat /tmp/diskusage

# Check Load Average
loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')
echo -e '\E[32m'"Load Average :" $tecreset $loadaverage

# Check System Uptime
tecuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
echo -e '\E[32m'"System Uptime Days/(HH:MM) :" $tecreset $tecuptime

# Unset Variables
unset tecreset os architecture kernelrelease internalip externalip nameserver loadaverage

# Remove Temporary Files
rm /tmp/osrelease /tmp/who /tmp/ramcache /tmp/diskusage
}
fi
shift $(($OPTIND -1))

```
[Tecmint - script](http://www.tecmint.com/linux-server-health-monitoring-script/)
