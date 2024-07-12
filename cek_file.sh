#!/bin/bash
echo "apakah file mu berada di direktori??:y/n"
read user1
if [ $user1 = 'y' ]; then #if cek user apakah mencari file didrirektori atau tidak
echo "masukan nama direktori mu :"
read direk
if [ -d $direk ]; then #if cek apakah direktori ada atau tidak
./hitung.sh "$direk"
echo "heyy direktori mu ada"
cd $direk
ls 
echo "apakah file mu berada disini??:y/n"
read user2
if [ $user2 = 'y' ]; then #if mengecek keberadaan file di direktori ini 
echo "baiklah silahkan masukan nama file mu :"
read user3 
if [ -f $user3 ]; then #if mengecek apakah file ada atau tidak
echo "file mu ada!!!"
else #else dari cek file apakah ada atau tidak
echo "file mu tidak ada!!"
fi #fi dari cek file ada atau tidak 
else #else dari cek keberadaan file di direktori ini
echo "baiklah silahkan ingin pindah kemana :"
read user4
cd $user4
ls
echo "apakah file mu berada disni??:y/n"
read user5
if [ $user5 = 'y' ]; then #if dari user5 cek apakah file berada disni
echo "silahkan masukan nama file mu :"
read file3
if [ -f $file3 ]; then #if dari file3 untuk cek file ada atau tidak
echo "file mu ada"
else #else dari file3 cek file ada atau tidak
echo "yahh sepertinnya file mu tidak ada"
fi #fi dari file3 untuk cek file ada atau tidak
else 
echo "silahkan ingin pindah kemana:"
read user6
cd $user6
ls
echo "apakah file mu berada disini??:y/n"
read user7
if [ $user7 = 'y' ]; then #if user7 cek keberadaan file di direktori ini 
echo "masukan nama file mu :"
read file5
if [ -f $file5 ]; then #cek file5 apakah file ada atau tidak
echo "file mu ada!!!"
else
echo "file mu tidak ada!!"
fi #fi file5 cek apakah file ada atau tidalk
else 
echo "jadi ingin pindah kemana:"
read user8
cd $user8
ls
echo "yang mana file yang kau cari:"
read file7
if [ -f $file7 ]; then
echo "file mu ada"
else
echo "file mu tidak ada!!"
fi
fi #fi user7 cek keberadaan file di direktori ini
fi #fi dari user5 cek apakah file berada disini
fi #fi dari cek keberadaan file di direktori ini
else #else cek direktori
echo "direktori mu tidak ada"
fi #fi penutup dari if cek direktori
else #else dari if pertama
echo "jika begitu masukan nama file mu:"
read file
if [ -f $file ]; then #if cek file di luar direktori
echo "file mu ada"
else #else dari if cek file
echo "file mu tidak ada"
fi #penutup if file
fi #penutup if pertama
