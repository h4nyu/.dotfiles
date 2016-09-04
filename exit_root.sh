
echo $(id -u)
if [ "$(id -u)" = "0" ]; then
    echo "this is root user"
    echo "then exit"
    exit
elif [ "$(id -u)" != "0" ]; then
    echo "this is not root user"
    echo "this script will run"
fi
