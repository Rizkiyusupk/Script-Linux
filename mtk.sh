#!/bin/bash
echo  "masukan angka pertama mu :" 
read angka1
echo  "masukan angka kedua mu :" 
read angka2
echo  "pilih operasi bilangan mu:  " 
read ope
if [ $ope = '+' ]; then
echo $(( angka1 + angka2 ))
elif [ $ope = '-' ]; then
echo $(( angka1 - angka2 ))
elif [ $ope = '*' ]; then
echo $(( angka1 * angka2 ))
elif [ $ope = '/' ]; then
echo $(( angka1 / angka2 ))
fi
