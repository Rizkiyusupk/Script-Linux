#!/bin/bash
#input untuk menambah user
log_db() {
	id=$1
	nama=$2
	password=$3
	mysql -u iki -piki123 -e "use latihan; insert into user (id, nama, password) values('$id', '$nama', '$password')"
}
read -p "Masukan id	:" id
read -p "Masukan username : " nama
read -sp "Masukan password : " password
echo 
sudo useradd -m $nama
echo "$nama:$password" | sudo chpasswd

log_db "$id" "$nama" "$password" 
echo "user $nama telah ditambahkan ke sistem dan data disimpan di Database"
