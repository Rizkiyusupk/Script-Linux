#!/bin/bash
while true
do
	read -p "input services name :" service
	read -p "input image name :" image
	read -p "input which ports you will use,example 1111:80 :" ports
	read -p "input dockerfile :" docker
	read -p "input volumes :" volumes
	read -p "input for destination the file :" volumes1
	read -p "done? :y/n" user
	if [ $user == 'y' ]
	then
cat <<EOF > docker-compose.yaml
version: "3.8"
services:
  $service:
    image: "$image"
    ports: 
    - "$ports"
    build:  $docker
    volumes:
    - $volumes:$volumes1				
EOF
		break
	else
		echo "sorry buddy i have no idea :>"
	fi
done


