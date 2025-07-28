while IFS=',' read -r username password
do
    if [ "$username" != "username" ]; then
        useradd -m "$username"
        echo "$username:$password" | chpasswd
        echo "User '$username' dibuat dengan password."
    fi
done < 'user.csv'

