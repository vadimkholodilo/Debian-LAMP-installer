function check_root {
current_user=`whoami`
if [ "$current_user" != "root" ]; then
return 1
else return 0
fi
}