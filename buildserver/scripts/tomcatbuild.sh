#! /usr/bin/bash
#
# Author: Sebastiaan Van Hoecke
#
# PURPOSE
# See usage() for details.

#{{{ Bash settings
# abort on nonzero exitstatus
set -o errexit
# abort on unbound variable
set -o nounset
# don't hide errors within pipes
set -o pipefail
#}}}
#{{{ Variables
readonly SCRIPT_NAME=$(basename "${0}")
readonly SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
IFS=$'\t\n'   # Split on newlines and tabs (but not on spaces)

#}}}

main() {

#!/bin/bash

i=0


while [ $i -lt 59 ]; do

if [ "$(ls -A /home/vagrant/tobuild)" ]; then


file=`cat /home/vagrant/tobuild/filetobuild | cut -d "/" -f8`

if [[ $file == *.war ]]
then
scp -r /home/vagrant/tobuild/$file vagrant@192.168.56.11:/usr/share/tomcat/webapps
rm -rf /home/vagrant/tobuild/$file
rm -rf /home/vagrant/tobuild/filetobuild
elif [[ $file == *.zip ]]
then
fileunzipped=`cat /home/vagrant/tobuild/filetobuild | cut -d "/" -f8 | cut -d "." -f1`
unzip /home/vagrant/tobuild/DbDemo.zip -d /home/vagrant/tobuild

cd /home/vagrant/tobuild/$fileunzipped
mvn compile
mvn package
cd /home/vagrant/
warfile=`ls /home/vagrant/tobuild/$fileunzipped/target/ | grep .war`
scp -r /home/vagrant/tobuild/$fileunzipped/target/$warfile vagrant@192.168.56.11:/usr/share/tomcat/webapps
rm -rf /home/vagrant/tobuild/$file
rm -rf /home/vagrant/tobuild/filetobuild
rm -rf /home/vagrant/tobuild/$fileunzipped
echo ""
elif [[ $file == *.rar ]]
then
#TODOO
echo ""
elif [[ $file == *.tar ]]
then
#TODOO
echo ""
elif [[ $file == *.we ]]
then
#TODOO
echo ""

fi

else
echo ""
fi


  sleep 1
  i=$(( i + 1 ))


done



}

#{{{ Helper functions

# Check if command line arguments are valid
check_args() {
  if [ "${#}" -ne "2" ]; then
    echo "Expected 1 argument, got ${#}" >&2
    usage
    exit 2
  fi
}

# Print usage message on stdout
usage() {
cat << _EOF_
Usage: ${0} []OPTIONS]... [ARGS]...

  description

OPTIONS:

EXAMPLES:
_EOF_
}

#}}}

main
