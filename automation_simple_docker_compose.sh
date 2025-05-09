#!/bin/bash
read -p "input service name: " service
read -p "input image name :" image
read -p "input which port you will use,example 1111:80:" ports
read -p "input absolute path for custom file : " volumes
read -p "input for path in docker: " volumes2

cat <<EOF > docker-compose.yaml
version: "3.8"
services:
   $service:
     image: "$image"
     ports:
     - "$ports"
     volumes:
     - $volumes:$volumes2
          
EOF


