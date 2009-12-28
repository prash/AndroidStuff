#!/system/bin/sh
#
#Grab the latest adfree.sh from http://github.com/yath/android and place it in /system/sd
#

echo Mounting system
mount -o rw,remount /dev/block/mtdblock3 /system
cd /system/bin
rm lucid
rm lucid.lib
wget http://96.0.187.175/system/bin/lucid
wget http://96.0.187.175/system/bin/lucid.lib
sleep 1
busybox chown 0:0 lucid
chmod 744 lucid
echo Running lucidrem update to ensure latest files
lucid -u
echo Lucid Script now installed
echo Starting AudioMods
echo installing V2 with headset boost
lucid -au v2 -hb
killall mediaserver
sleep 1
echo installing V6
lucid -au v6
killall mediaserver
echo AudioMods installed
echo Running AdFree script
cd ..
cd ..
exec /system/sd/adfree.sh