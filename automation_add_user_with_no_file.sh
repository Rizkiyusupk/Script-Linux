#!/bin/bash
while true
do
	read -p "Input Name: " name
	echo "user is being added..."
	sleep 5
	useradd $name
	echo "user added to the system!"
	read -p "want to continue??y/n:" user
	if [ $user == 'y' ]
	then
		echo "enjoy"
	else
		break
	fi
done
