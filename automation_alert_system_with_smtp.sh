#!/bin/bash
#Make sure you already config smtp server 
#you can use this script with cron job as daily alert for your system
#in this script im using a variable 
while true
do
	read -p "apps name: " apps
	system=$(systemctl is-active $apps)
	echo "checking....."
	sleep 5
	if [ $system == 'active' ];
	then
		echo "System is active"
		break
	else
		echo "your system mus be have some problem!!"
		echo "sending to your email..."
		sleep 5
		echo "ALERT SOME EROR IN YOUR $apps" | mail -s "EROR ALERT!!!!!!!" rizkiyk61@email.com
		echo "successfully sending to your email....."
		echo "restarting your system"
		systemctl restart $apps
		break
	fi

done
