#!/bin/sh

#  install.sh
#  RemoveOldTimeMachine
#
#  Created by Andrew Romanov on 17/05/2018.
#  Copyright © 2018 Andrew Romanov. All rights reserved.

SCRIPT_DIRECTORY="$(dirname $0)"
DESTINATION=$SCRIPT_DIRECTORY/RunBackup.sh
cp $DESTINATION ~/autorunScripts/timeMashine/RunBackup.sh
echo "installed to ${DESTINATION}"

#CronTab file:
#SHELL=/bin/bash
#PATH=/opt/local/bin:/opt/local/sbin:/Library/Frameworks/Python.framework/Versions/3.5/bin:/Users/andrew/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Frameworks/Mono.framework/Commands/
#
#5 * * * *  bash ~/autorunScripts/timeMashine/RunBackup.sh
