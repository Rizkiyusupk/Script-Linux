#!/bin/bash
batas_waktu="17:10"
pesan="tidur woyy dah malem"
while true; do
current_time=$(date +%H:%M)
if [ "$batas_waktu" == "$current_time" ]; then
echo $pesan
break
fi
sleep 60
done

