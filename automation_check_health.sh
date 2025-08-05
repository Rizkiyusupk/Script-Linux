#!/bin/bash
while true
do
	system="$(df -h | awk '$1== "/dev/sda2" && $5 == "9%" {print $0}')"
	system1="$(echo $?)"
	if [ $system1 -eq 0 ]
	then
		echo "mengirim mail!!!"
		sleep 2
		echo "CPU USAGE IS NORMAL" | mail -s "CPU USAGE" example@gmail.com
		echo "done!!"
		break 
	fi
	sleep 5
done
