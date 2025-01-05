#!/bin/bash
echo "haii boss butuh container buat deploy??"
read bos
lower_bos=$(echo "$bos" | tr "[:upper:]" "[:lower:]")
if [ $lower_bos == "iya" ];
then

        echo "baik mau ngambil image yang mana??"
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
                         docker run -it --name sql_container'$counter' -e  MYSQL_ROOT_PASSWORD=iki123  mysql:latest 
			 	echo "root password nya iki123"
                               ((counter++))
                        done
		elif [ $lower_bos == 'mariadb' ]
		then
			echo "baiklah bos kamu memilih buat container database"
			echo "jadi sehubung dengan container yang menyimpan database apakah kamu mau pake bind buat jaga jaga backup datanya,jadi mau ga bos?"
			read bos_c 
			lower_bos_c=$(echo "$bos_c" | tr "[:upper:]" "[:lower:]")
			if [ $lower_bos_c == 'iya' ]
			then
				echo "ehh pak boss sekalian ga pak boss mau sama port forwarding nya??"
				read bos_c2 
				lower_bos_c2=$(echo "$bos_c2" | tr "[:upper:]" "[:lower:]")
				if [ $lower_bos_c2 == 'iya' ]
				then
					echo "baiklah pak bos mau nya bind container sama port forwarding yaa okeh jadi tinggal masukan input ya bos!!"
					echo "masukan input buat bind pake absolute path yah bos!!"
					read bos_c3
					lower_bos_c3=$( echo "$bos_c3" | tr "[:upper:]" "[:lower:]")
					if [ -d $lower_bos_c ]
					then
						echo "masukan input buat port forwardnya buat di host"
        	                                read bos_c4
	                                        echo "masukan input buat port forwardnya buat di container"
                                       		read bos_c4_cont
                                       	        echo "sekalian pak bos nama untuk container nya"
            	                                read nama_cont
                    	                        echo "sama masukan buat kata sandi root nya pak boss"
                                                read sandi
                                                lower_sandi=$(echo "$sandi" | tr "[:upper:]" "[:lower:]")
                                                lower_nama_cont=$(echo "$nama_cont" | tr "[:upper:]" "[:lower:]")
                                docker run -v "$lower_bos_c3:/var/lib/msysql" -d --name "$lower_nama_cont" -p $bos_c4:$bos_c4_cont -e MARIADB_ROOT_PASSWORD=$lower_sandi mariadb:latest
                        mysql -P $bos_c4 -u root -p$lower_sandi
	else
			echo "waduhh direktorinya belum ada pak boss saya bikinin dulu!!!"
			mkdir $lower_bos_c3
		        echo "masukan input buat port forwardnya buat di host"
                        read bos_c4
                        echo "masukan input buat port forwardnya buat di container"
                        read bos_c4_cont
                        echo "sekalian pak bos nama untuk container nya"                       
                        read nama_cont
                        echo "sama masukan buat kata sandi root nya pak boss"
                        read sandi
                        lower_sandi=$(echo "$sandi" | tr "[:upper:]" "[:lower:]")
                        lower_nama_cont=$(echo "$nama_cont" | tr "[:upper:]" "[:lower:]")
                        	docker run -v "$lower_bos_c3:/var/lib/msysql" -d --name "$lower_nama_cont" -p $bos_c4:$bos_c4_cont -e MARIADB_ROOT_PASSWORD=$lower_sandi mariadb:latest
				 mysql -P $bos_c4 -u root -p$lower_sandi

					fi
				else
					echo "baiklah jika pak boss ga mau port forward"
					echo "silahkan pak bos masukin absolute path direktorinya"
					read bos_c5
					lower_bos_c5=$(echo "$bos_c5" | tr "[:upper:]" "[:lower:]")
					if [ -d $lower_bos_c5 ]
					then
						echo "direktorinya ada bos silahkan untuk input langsung semua yang dibutuhkan"
						echo "sekalian pak bos nama buat containernya "
						read nama
						lower_nama=$(echo "$nama" |  tr "[:upper:]" "[:lower:]" )
						echo "sama password root nya pak bos"
						read password
						lower_password=$(echo "$password" |  tr "[:upper:]" "[:lower:]")
						docker run -v "$lower_bos_c5:/var/lib/mysql" -d --name "$lower_nama" -e MARIADB_ROOT_PASSWORD=$lower_password mariadb:latest
					else
						echo "aduhh pak boss direktorinya belum ada saya buatkan dulu"
						mkdir  $lower_bos_c5 
						echo "sekalian pak bos nama buat containernya "
                                                read nama
                                                lower_nama=$(echo "$nama" |  tr "[:upper:]" "[:lower:]" )
                                                echo "sama password root nya pak bos"
                                                read password
                                                lower_password=$(echo "$password" |  tr "[:upper:]" "[:lower:]")
                                                docker run -v "$lower_bos_c5:/var/lib/mysql" -d --name "$lower_nama" -e MARIADB_ROOT_PASSWORD=$lower_password mariadb:latest

					fi
				fi
			fi

	fi
fi
