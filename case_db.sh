#!/bin/bash

# Fungsi untuk menyimpan input ke database MariaDB
log_to_db() {
    local input="$1"
    mysql -u iki -piki123 -e  "USE latihan; INSERT INTO log_input (input_text) VALUES ('$input');"
}
log_db() {
	nama_barang=$1
	mysql -u  iki -p$your_secret_password -e "use latihan ; select * from stock_barang where nama_barang='$nama_barang'" -t
}

echo "heyy what i can do for you sir"
echo "want to check product stock,y/n??"
read cs
input_cs=$(echo "$cs" | tr "[:upper:]" "[:lower:]")

# Log input pertama
if [ "$input_cs" == 'y' ];
then
	read -p "Masukan nama barang: " nama_barang
        log_db "$nama_barang"
        db=$("log_db")
        echo "$db"


fi
if [ "$input_cs" == 'n' ]; then
    echo "alrigth so what you want??"
    read cs1
    lower=$(echo "$cs1" | tr "[:upper:]" "[:lower:]")

    # Log input kedua
    log_to_db "$cs1"

    case $lower in
        "vegetable")
            echo "for $cs1 is located in aisle 2"
            echo "is there anything i can do for you again sir?y/n"
            read cs2
            lower1=$(echo "$cs2" | tr "[:upper:]" "[:lower:]")

            if [ "$lower1" == "y" ]; then
                read cs1
                lower_cs1=$(echo "$cs1" | tr "[:upper:]" "[:lower:]")
                log_to_db "$cs1"
                
                case $lower_cs1 in 
                    "red paprika")
                        echo "The $lower_cs1 is located on shelf 1, aisle 2."
                        ;;
                    "yellow paprika")
                        echo "The $lower_cs1 is located on shelf 2, aisle 2"
                        ;;
                    "spinach")
                        echo "The $lower_cs1 is located on shelf 3, aisle 2"
                        ;;
                esac
            fi
            echo "alright thank you for coming!!!"
            ;;
        "meat")
            echo "for $cs1 is located in aisle 3"
            echo "is there anything i can do for you again sir?y/n"
            read csi
            lower_csi=$(echo "$csi" | tr "[:upper:]" "[:lower:]")


            if [ "$lower_csi" == "y" ]; then
                read cs3
                lower_cs3=$(echo "$cs3" | tr "[:upper:]" "[:lower:]")
                log_to_db "$lower_cs3"

                case $lower_cs3 in
                    "pork")
                        echo "the $lower_cs3 is located on shelf 1, aisle 3"
                        ;;
                    "chicken")
                        echo "the $lower_cs3 is located on shelf 1, aisle 3"
                        ;;
                    "beef")
                        echo "the $lower_cs3 is located on shelf 1, aisle 3"                 
			;;
                esac
            fi
            echo "thank you for coming!!"
            ;;
        "fruit")
            echo "for $cs1 is located at aisle 1"
            echo "is there anything i can do for you again sir?y/n"
            read cs3
            lower_cs3=$(echo "$cs3" | tr "[:upper:]" "[:lower:]")
       

            if [ "$lower_cs3" == "y" ]; then
                read csi
                lower_csi=$(echo "$csi" | tr "[:upper:]" "[:lower:]")
                log_to_db "$csi"

                case $lower_csi in
                    "mango")
                        echo "the $lower_csi is located on shelf 1, aisle 1"
                        ;;
                    "orange")
                        echo "the $lower_csi is located on shelf 2, aisle 1"
                        ;;
                    "pinnaple")
                        echo "the $lower_csi is located on shelf 3, aisle 1"
                        ;;
                esac
            fi
            echo "thenk you!!!"
            ;;  
    esac
fi

