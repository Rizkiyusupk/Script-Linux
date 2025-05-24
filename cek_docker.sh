#!/bin/bash
read -p "eyy yoo mau cek kondisi docker mu mati atau tidak?? :y/n " cek
if [[ $cek == 'y' ]];
then
	read -p "masukan nama container mu :" cont
	echo "baik aku cek dulu ya containernya!!!"
	status=$(docker ps -a --filter "name=$cont" --format "{{.Status}}")

	if [[ $status == Up* ]];
	then
		echo "yeyy container mu berjalan dengan lancar!!!"
		
	elif [[ $status == Exited* ]]; then
		echo "yahh container lagi down coba ku restart!!"
		echo "menunggu......"
	docker restart "$cont"
		echo "restart sudaah!!"
	else
		echo "container tidak ada"
	fi
fi
