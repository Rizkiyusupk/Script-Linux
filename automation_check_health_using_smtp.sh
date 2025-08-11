#!/bin/bash
while true
do
	echo "pengecekan sistem..."
	sleep 5
	system="$(df -h | awk '{usage = substr ($5,1, length($5)-1); if (usage+0 > 10) print "pengunaan disk diatas batas wajar:"$5}' > output.txt )"
	echo "pengiriman laporan melalui email.."
	sleep 5
	system1="$(top -b -n1 | awk '{ if ($9 > 60 && $12 == "stress") { print "penggunaan cpu diatas batas wajar:", $9 }}' >> output.txt)" 
	echo "Ini hasil monitoring CPU dan Disk." | mutt -s "Laporan Monitoring" -a output.txt -- example@gmail.com
	echo "done"
	break
done
