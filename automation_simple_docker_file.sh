#!/bin/bash
read -p "input base image :" image
read -p "input file that will be copy :" file 
read -p "input the destination for file :" file1
read -p "input the ports that will be expose  :" ports

cat <<EOF > Dockerfile 
FROM $image
COPY $file $file1
EXPOSE $ports
EOF
