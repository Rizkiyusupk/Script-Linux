#!/bin/bash
echo "haii boss butuh container buat deploy??"
read bos
lower_bos=$(echo "$bos" | tr "[:upper:]" "[:lower:]")
if [ $lower_bos == "iya" ];
then

        echo "baik mau ngambil image yang mana??"
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
		 echo "baik bos butuh berapa container??"
                        read bos_c
                        counter=1
                        while [ $counter -le $bos_c ];
                        do
                                echo "hello world"
                        docker run -it --name ubuntu_"$counter" ubuntu:latest bash
                               ((counter++))
                        done
		elif [ $lower_bos == 'mysql' ]
		then
			echo "baik bos butuh berapa container??"
                        read bos_c
                        counter=1
                        while [ $counter -le $bos_c ];
                        do
                                echo "hello world"
                         docker run -it --name sql_container'$counter' -e  mysql_root_password=iki123  mysql:latest 
                               ((counter++))
                        done
		elif [ $lower_bos == 'mariadb' ]
		then
			  echo "baik bos butuh berapa container??"
                        read bos_c
                        counter=1
                        while [ $counter -le $bos_c ];
                        do
                                echo "hello world"
                         docker run -d --name mariadb1"$counter" -e MARIADB_ROOT_PASSWORD=iki123 mariadb:latest
                               ((counter++))
                        done

	fi
fi
