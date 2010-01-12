#!/bin/bash
##
# created by loomsen <loomsen@gmail.com>
# inspired by Daniel Cardenas <gaarauzumaki23@gmail.com>
##
# do not run this script as root
if [ "$UID" == "0" ]; then
echo -e "you should not run this script as root, exiting now"
exit 1
fi
 
echo "You Are About To Backup All Your Apps From Your Android Phone"
function error_exit
{
echo "adb not found"
exit 1
}
 
[[ -x `which adb 2>/dev/null` ]] || error_exit
_ADB=`which adb`
export BACKUPDIR=$HOME/android-sdk/backups/$(date +"%b-%d-%y") 
mkdir -p $BACKUPDIR

# folders to backup
folders="/system/sd/app
/system/sd/app-private
/system/app
/system/app-private"

for i in $folders; do $_ADB pull $i $BACKUPDIR; done

exit $?