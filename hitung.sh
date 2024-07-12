#!/bin/bash
nam=$1
counter=0
for hitung in "$nam"/*
do
if [ -d $hitung ]; then
counter=$(( counter + 1 ))
echo "jumlah subdirektori di direktori disini ada "$counter
fi
done

