#!/bin/bash
sesi1=(januari febuari maret april mei juni)
sesi2=(juli agustus september oktober november desember)
se=(sesi-1)
se1=(sesi-2)
waktu=(date +%Y-%m-%D_%H:%M:%S)

for se in "${se[@]}"
do
mkdir -p maintence/$se
for bulan in "${sesi1[@]}"
do
mkdir -p maintence/$se/$bulan
for minggu in {1..4}
do
mkdir -p maintence/$se/$bulan/$minggu
for hari in {1..7}
do
echo  "file ini berada di folder maintence sesi-1 dan di buat pada "$waktu > maintence/$se/$bulan/$minggu/hari-$hari.txt
done
done
done
done

for se1 in "${se1[@]}"
do 
mkdir -p maintence/$se1
for bulan1 in "${sesi2[@]}"
do
mkdir -p maintence/$se1/$bulan1
for minggu in {1..4}
do
mkdir -p maintence/$se1/$bulan1/$minggu
for hari in {1..7}
do
echo "file ini berada di folder maintence sesi-2 dan dibuat pada "$waktu > maintence/$se1/$bulan1/$minggu/hari-$hari.txt
done
done
done
done

