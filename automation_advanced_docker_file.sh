#!/bin/bash
while true
do
	read -p "input base image :" image
	read -p "input Workdir :" dir
	read -p "input file you will copy:" file
	read -p "input the destination file:" file1
	read -p "input ports :" ports
	read -p "done? :y/n" user
	if [ $user == 'y' ]
	then
cat <<EOF > Dockerfile
FROM $image
WORKDIR $dir
COPY $file $file1
EXPOSE $ports				
EOF
		break
	else
		echo "sorry buddy i have no idea :>"
	fi
done


