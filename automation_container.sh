#!/bin/bash
echo "haii boss want to make a container,y/n??"
read bos
lower_bos=$(echo "$bos" | tr "[:upper:]" "[:lower:]")
if [ $lower_bos == "y" ];
then

        echo "what images you want??"
        images=(ubuntu mysql maridb)
        for i in {!}
        do
                for j in "${images[@]}"
                do
                        echo "$i)$j"
                done
        done
        read bos2
        lower_bos=$(echo "$bos2" | tr "[:upper:]" "[:lower:]")
        if [ $lower_bos == 'ubuntu' ];
	then
		 echo "how many container you need??"
                        read bos_c
                        counter=1
                        while [ $counter -le $bos_c ];
                        do
                                
                        docker run -it --name ubuntu_"$counter" ubuntu:latest bash
                               ((counter++))
                        done
		elif [ $lower_bos == 'mysql' ]
		then
			echo "how many container you need??"
                        read bos_c
			echo "because this is a database container so you need a root password"
   			echo "input for root password"
      			read password
	 		echo "name for your container"
    			read cont_name
       			lower_cont_name=$(echo "$cont_name" | tr "[:upper:]" "[:lower:]")
	 		lower_password=$(echo "$password" | tr "[::upper]" "[:lower:]")
                        counter=1
                        while [ $counter -le $bos_c ];
                        do
                         docker run -d --name "$lower_cont_name"-"$counter" -e  MYSQL_ROOT_PASSWORD=$lower_password mysql:latest
                               ((counter++))
                        done
		elif [ $lower_bos == 'mariadb' ]
		then
			echo "how many container you need??"
                        read bos_c
			echo "because this is a database container so you need a root password"
   			read password
      			lower_password=$(echo "$password" | tr "[:upper:]" "[:lower:]")
	 		echo "name for your container"
    			read cont_name
       			lower_cont_name=$(echo "$cont_name" | tr "[:upper:]" "[:lower:]")
   			counter=1
                        while [ $counter -le $bos_c ];
                        do
                         docker run -d --name "$lower_password"-"$counter" -e MARIADB_ROOT_PASSWORD=your_secret_password mariadb:latest
                               ((counter++))
                        done

	fi
fi
