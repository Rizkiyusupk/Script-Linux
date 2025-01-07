#!/bin/bash
echo "haii bos want to deploy a container??y/n"
read bos
lower_bos=$(echo "$bos" | tr "[:upper:]" "[:lower:]")
if [ $lower_bos == "y" ];
then

        echo "alright which want images you want to use??"
        images=(ubuntu mysql mariadb)
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
		 	echo "alright boss how many container you want???"
                        read bos_c
                        counter=1
                        while [ $counter -le $bos_c ];
                        do
                                echo "hello world"
                        docker run -d --name ubuntu_"$counter" ubuntu:latest bash
                               ((counter++))
                        done
		elif [ $lower_bos == 'mysql' ]
		then
			echo "alright bos how many container you want???"
                        read bos_c
			echo "and password for login to the database??"
   			read user
                        counter=1
                        while [ $counter -le $bos_c ];
                        do
                                echo "hello world"
                         docker run -d --name sql_container'$counter' -e  MYSQL_ROOT_PASSWORD=$user  mysql:latest 
                               ((counter++))
                        done
		elif [ $lower_bos == 'mariadb' ]
		then
			echo "alright bos so you chose an database images"
			echo "cause you chose an database images you should make a bind for you database bakcup,y/n"
			read bind
			lower_bind=$(echo "$bind" | tr "[:upper:]" "[:lower:]")
			if [ $lower_bind == 'y' ]
			then
				echo "do you want port forwarding also,y/n??"
				read port_forward 
				lower_port_forward=$(echo "$port_forward" | tr "[:upper:]" "[:lower:]")
				if [ $lower_port_forward == 'y/n' ]
				then
					echo "so you want both !!"
					echo "input for absolute path for bind!!"
					read bind_path
					lower_bind_path=$( echo "$bind_path" | tr "[:upper:]" "[:lower:]")
					if [ -d $lower_bos_c ]
					then
						echo "input for port forward for your host"
        	                                read port_host
	                                        echo "input for port forward for your container"
                                       		read port_cont
                                       	        echo "container name"
            	                                read con_name
                    	                        echo "for root password"
                                                read password
                                                lower_password=$(echo "$password" | tr "[:upper:]" "[:lower:]")
                                                lower_cont_name=$(echo "$cont_name" | tr "[:upper:]" "[:lower:]")
                                docker run -v "$lower_bind_path:/var/lib/msysql" -d --name "$cont_name" -p $port_host:$port_cont -e MARIADB_ROOT_PASSWORD=$lower_sandi mariadb:latest
	else
			echo "there is no such a directory like that,i'll make it first!!!"
			mkdir $lower_bind
		        echo "input port forward for your host"
                        read port_host
                        echo "input port forward for your container"
                        read port_cont
                        echo "container name"                       
                        read cont_name
			echo "for root password"
                        read password
                        lower_password=$(echo "$password" | tr "[:upper:]" "[:lower:]")
                        lower_cont_name=$(echo "$cont_name" | tr "[:upper:]" "[:lower:]")
                        	docker run -v "$lower_bind:/var/lib/msysql" -d --name "$cont_name" -p $port_host:$port_cont -e MARIADB_ROOT_PASSWORD=$lower_password mariadb:latest
					fi
				else
					echo "so you just want to bind the container without using port forward"
					echo "input for the absolute path"
					read bind_path
					lower_bind_path=$(echo "$bind_path" | tr "[:upper:]" "[:lower:]")
					if [ -d $lower_bos_c5 ]
					then
						echo "right all good "
						echo "name for then container "
						read cont_name
						lower_cont_name=$(echo "$cont_name" |  tr "[:upper:]" "[:lower:]" )
						echo "root password"
						read password
						lower_password=$(echo "$password" |  tr "[:upper:]" "[:lower:]")
						docker run -v "$lower_bind_path:/var/lib/mysql" -d --name "$lower_cont_name" -e MARIADB_ROOT_PASSWORD=$lower_password mariadb:latest
					else
						echo "there no such directory name like that,i'll make it first!!! "
						mkdir  $lower_bind_path 
						echo "container name "
                                                read cont_name
                                                lower_cont_name=$(echo "$cont_name" |  tr "[:upper:]" "[:lower:]" )
                                                echo "for root password"
                                                read password
                                                lower_password=$(echo "$password" |  tr "[:upper:]" "[:lower:]")
                                                docker run -v "$lower_bind_path:/var/lib/mysql" -d --name "$lower_cont_name" -e MARIADB_ROOT_PASSWORD=$lower_password mariadb:latest

					fi
				fi
			fi

	fi
fi
