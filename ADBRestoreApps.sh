#!/bin/bash
##
# created by loomsen <loomsen@gmail.com>
##
# do not run this script as root
if [ "$UID" == "0" ]; then
echo -e "you should not run this script as root, exiting now"
exit 1
fi
 
function error_exit
{
echo "adb not found"
exit 1
}
 
[[ -x `which adb 2>/dev/null` ]] || error_exit
_ADB=`which adb`

export BACKUPDIR=$HOME/android-sdk/backups/$(date +"%b-%d-%y")

## to push em back to your sd, uncomment this
#for i in $BACKUPDIR/*.apk; do $_ADB push $i /system/sd/apps;done
## to install directly from your backupdir
for i in $BACKUPDIR/*.apk; do $_ADB install $i; done

exit $?