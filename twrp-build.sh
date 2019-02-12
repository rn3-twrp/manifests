#!/bin/bash

VERSION=`grep TW_MAIN_VERSION_STR bootable/recovery/variables.h | awk -F\" '{print $2}'`
DEVICECODENAME="kenzo"
DATE=`date +%Y%m%d`

# FuckingJack
./prebuilts/sdk/tools/jack-admin kill-server
export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4096m"
./prebuilts/sdk/tools/jack-admin start-server
export LANGUAGE=C

# Fix for loadlocale.c Bug on Ubuntu 18.04
export LC_ALL=C

# Fix for useless dependencies define in twrp-9.0 tree
export ALLOW_MISSING_DEPENDENCIES=true

# Initialize Environment and Lunch 
. build/envsetup.sh
lunch omni_kenzo-eng

# Make a clean build, building dirty after you have had jack issues may result in a failed build
make -j4 clean && make -j4 clobber

# Compile the build
make -j4 recoveryimage 2>&1 | tee build.log

# Copy the recovery image to home dictionary
cp out/target/product/$DEVICECODENAME/recovery.img /home/$USER/twrp-$VERSION-0-$DEVICECODENAME-$DATE.img

echo -e ""
