#!/bin/bash

# Fungsi untuk menyimpan input ke database MariaDB
log_to_db() {
    local input="$1"
    mysql -u iki -pyoursecurepassword -e  "USE latihan; INSERT INTO log_input (input_text) VALUES ('$input');"
}

echo "haii selamat datang di happymart ada yang bisa saya bantu"
read cs
input_cs=$(echo "$cs" | tr "[:upper:]" "[:lower:]")

# Log input pertama

if [ "$input_cs" == 'iya' ]; then
    echo "baiklah apa yang anda inginkan"
    read cs1
    lower=$(echo "$cs1" | tr "[:upper:]" "[:lower:]")

    # Log input kedua
    log_to_db "$cs1"

    case $lower in
        "sayur")
            echo "untuk $cs1 ada di koridor 2"
            echo "apakah masih ada yang bisa saya bantu?"
            read cs2
            lower1=$(echo "$cs2" | tr "[:upper:]" "[:lower:]")

            if [ "$lower1" == "ada" ]; then
                read cs1
                lower_cs1=$(echo "$cs1" | tr "[:upper:]" "[:lower:]")
                log_to_db "$cs1"
                
                case $lower_cs1 in 
                    "paprika merah")
                        echo "untuk $lower_cs1 ada di rak ke 1 di koridor 3"
                        ;;
                    "paprika kuning")
                        echo "untuk $lower_cs1 ada di rak ke 2 di koridor 3"
                        ;;
                    "bayam")
                        echo "untuk $lower_cs1 ada di rak ke 3 di koridor 3"
                        ;;
                esac
            fi
            echo "baiklah selamat berbelanja!!!"
            ;;
        "daging")
            echo "untuk $cs1 ada di koridor 3"
            echo "apakah masih ada yang bisa saya bantu?"
            read csi
            lower_csi=$(echo "$csi" | tr "[:upper:]" "[:lower:]")


            if [ "$lower_csi" == "ada" ]; then
                read cso
                lower_cso=$(echo "$cso" | tr "[:upper:]" "[:lower:]")
                log_to_db "$cso"

                case $lower_cso in
                    "daging babi")
                        echo "untuk $lower_cso ada di rak 2 koridor 3"
                        ;;
                    "daging ayam")
                        echo "untuk $lower_cso ada di rak 1 koridor 3"
                        ;;
                    "daging sapi")
                        echo "untuk $lower_cso ada di rak 3 koridor 3"
                        ;;
                esac
            fi
            echo "selamat berbelanja!!"
            ;;
        "buah")
            echo "untuk $cs1 berada di koridor 1"
            echo "apakah masih ada yang bisa saya bantu?"
            read cs3
            lower_cs3=$(echo "$cs3" | tr "[:upper:]" "[:lower:]")
       

            if [ "$lower_cs3" == "ada" ]; then
                read csi
                lower_csi=$(echo "$csi" | tr "[:upper:]" "[:lower:]")
                log_to_db "$csi"

                case $lower_csi in
                    "mangga")
                        echo "untuk $lower_csi ada di rak 1 di koridor 1"
                        ;;
                    "jeruk")
                        echo "untuk $lower_csi ada di rak 2 di koridor 1"
                        ;;
                    "nanas")
                        echo "untuk $lower_csi ada di rak 3 di koridor 1"
                        ;;
                esac
            fi
            echo "selamat berbelanja!!!"
            ;;  
    esac
fi

