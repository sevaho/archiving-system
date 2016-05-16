#!/bin/bash

i=0


while [ $i -lt 59 ]; do

filetotransfer=/home/vagrant/filestotransfer
file0=""
file00="/home/vagrant/files////"
file=`head -n 1 $filetotransfer`
echo $file

if [ "$file" == "$file00" ]
then
echo "///"
echo "$(tail -n +2 $filetotransfer)" > $filetotransfer
elif [ "$file" == "$file0" ]
then
echo "f"
echo "$(tail -n +2 $filetotransfer)" > $filetotransfer
else
echo "lijn: \n"
echo "$file"
scp -r $file vagrant@192.168.56.16:/home/vagrant/tobuild
ssh vagrant@192.168.56.16 "echo "$file" > /home/vagrant/tobuild/filetobuild"
echo "$(tail -n +2 $filetotransfer)" > $filetotransfer
fi


  sleep 1
  i=$(( i + 1 ))


done
