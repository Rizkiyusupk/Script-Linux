#!/bin/bash
while true
do
	read -p "Fullpath of your file: " file
	read -p "name of your backup file: " name
	tar -czf backup-$name.tar.gz $file
	read -p "want to backup again?y/n: " user
	if [ $user == 'y' ]
	then
		echo "enjoy"
	else
		break
	fi
done
