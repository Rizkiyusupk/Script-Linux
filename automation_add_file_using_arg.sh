#!/bin/bash

counter=1
while [ $counter -le $1 ]
do
	touch file-$counter.txt
	((counter++))
	if [ $counter -eq $1 ]
	then
		break
	fi	
done	




