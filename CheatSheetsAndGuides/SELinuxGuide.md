#SELinux

##Introduction

###What is it

&nbsp;

SELinux stand for Secured Enchanted Linux.

It is a mandatory access control system, SELinux is all about policies.

Policies can be set to determine access between:

+ Users
+ Files
+ Directories
+ Memory
+ Sockets
+ Tcp/udp ports
+ Etc..

###How does it work

&nbsp;

You can determine what policies your system is set, to use, look at:

```  bash
/etc/selinux/config (symlinked to /etc/sysconfig/selinux)
```

check via

```  bash
sestatus or getenforce
```

###Labeling and type enforcement

&nbsp;

Everything is labeled with an SELinux context

format: SELinuxUser:rol :type:level

check via

```  bash
ls -dlZ file
id -Z file
ps axZ
```

>example ports that are allowed for http in SELinux

```  bash
semanage port -l | grep http
```

type enforcement is quite nice, the main purpose here is to have an extra layer of protection for files to read acces other files, for example httpd with shadow.

##SELinux errors

'setenfore 0' works always but it's certainly not good, with this command you turn off SELinux.

###Most common issues

&nbsp;

+ Labeling is wrong

+ Policy needs to be tweaked (booleans)


+ Bug in the policy

Booleans are just on/off settings for SELinux.

commands:

```  bash
getsebool -a
setsebool [boolean] [0|1]
setsebool -P [boolean] [0|1]
```

Own booleans:

```  bash
sudo cat /var/lib/selinux/targeted/active/booleans.local
```

###Troubleshoot

&nbsp;

logs:

```  bash
/var/log/
```

better, mostly you will find information about SELinux here:

```  bash

/var/log/messages

or

/var/log/audit/audit.log
```

copy paste the output for example:

```  bash
sealert -l 65465456bb-54564b-465454a-6456b-54545641d541
```

or

```  bash

grep **selinuxerror** /var/log/audit/audit.log | audit2allow
semodule -i selinuxerror.pp
```


#####Other problems

for example you moved some files and now it's not working anymore (fe. apache), problems lies with labels.

do:

```  bash
ls -aZ
chcon --reference parentFolder file
or
restorecon -vR /parentFolder (/var/www/)
```

If you want to give a folder the same label as an other folder for example /var/www/ and /foo/

```  bash
semanage fcontext -a -e /var/www/ /foo/
restorecon -vR /foo/
```

&nbsp;

###extra

&nbsp;

You can install setroubleshoot and setroubleshoot-server then restart auditd.

This will help you diagnose and fix SELinux issues.


[source: selinux for mere mortals] (https://www.youtube.com/watch?v=MxjenQ31b70)
