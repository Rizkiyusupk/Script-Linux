while true
do
	echo "masukan nama image mu untuk di tag:"
	read image
docker tag $image rizki736/$image
        echo "apakah masih mau buat tag lagi:y/n"
	read user
docker push rizki736/$image
	if [ $user == 'y' ]
	then
		echo "baikk masukan lagi nama imagenya"
	else
		break
	fi

done

