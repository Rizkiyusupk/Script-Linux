#!/bin/bash
read -p "heyy apakah kau ingin mengecek kondisi container mu??:y/n " usr
if [[ $usr == "y" ]];
then
	while true;
	do
	read -p "baik masukan nama dari container mu: " cont
	echo "tunggu sedang di periksa!!!"
	hasil=$(docker ps -a --filter "name=$cont" --format "{{.Status}}")
	if [[ $hasil == Up* ]]; 
	then
		echo "wahh container mu baik baik saja!!!"
		break
	elif [[ $hasil == Exited* ]];
	then
		echo "hmmm container mu ada masalah seperti nya coba ku restart terlebih dahulu!!"
		docker restart "$cont"
  		sleep 1
    		hasil1=$(docker ps -a --filter "name=$cont" --format "{{.Status}}")
		if [[ $hasil1 == Up* ]]; 
		then
			echo "yeyy docker nya sudah up lagiii!!!"
			break
		elif [[ $hasil1 == Exited* ]]; 
		then
			echo "seperti nya ada sesuatu yang salah dengan config dari docker mu coba kau lihat dengan docker logs!!"
			break
		fi
	else 
		echo "tidak ada nama container seperti itu!!"
		break
	fi
	done
else
	echo "ya sudah kalau tidak mau selama tinggal!!"
fi
