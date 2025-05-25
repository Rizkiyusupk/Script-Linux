#!/bin/bash
while true 
do
	echo "system cek otomatis dari server"
	echo "sedang mengecek....."
	sleep 5
	cek=$(systemctl status nginx | grep -oP 'status=\K[0-9]+' |  head -n1)
	if [[ $cek -eq 0 ]];
	then
		echo "sistem mu baik baik saja silahkan kembali beraktivitas!!!"
	else
		echo "ada eror di nginx webserver mu!!!"
                echo "mengirim ke alamat emaill!!"
                echo "mengirim..."
                sleep 10
                echo "EROR TERDETEKSI!!! SEGERA TANGANI JIKA TIDAK WEBSITE AKAN DOWN UNTUK WAKTU YANG LAMA" | mail -s "EROR TERDETEKSI" mail.example.com
   	  	break

	fi
done
