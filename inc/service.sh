# Utility to run and stop services
# Some systems don't support SystemD, so services must be started with Upstart or even SystemV. However, my scripts will not support SystemV, because it is very old
# The same is applied to enabling services on boot


function service_do_action {
# Service name and action must be provided $# is a flag which keeps number of arguments passed to a function
# The following actions are supported:
# start to start a service,
# stop to stop a service,
# enable to enable a service to start  on boot,
# disable to disable a service to start on boot
# restart to restart a service
# reload to reload configuration


if [ $# -ne 2 ]; then
echo "Service name and action must be provided"
exit 1
fi
echo "${1}ing $2"
command systemctl > /dev/null
if [ $? -eq 0 ]; then
systemctl $1 $2
else
# If we need to start or stop a service, we can directly pass an action, but if we need to enable a service on boot, another command must be used
if [ "$1" == "enable" or "$1" == "disable" ]; then
update-rc.d $1 $2
return
fi
service $2 $1
fi
}
