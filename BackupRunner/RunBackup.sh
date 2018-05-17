#!/bin/sh

#  RunBackup.sh
#  RemoveOldTimeMachine
#
#  Created by Andrew Romanov on 16/05/2018.
#  Copyright © 2018 Andrew Romanov. All rights reserved.

SCRIPT_DIRECTORY="$(dirname $0)"
LOG_FILE=$SCRIPT_DIRECTORY/"TimeMashine.log"
echo "${date} backup started" >> $LOG_FILE
xcrun tmutil startbackup --auto --block >> $LOG_FILE
echo "${date} backup ended" >> $LOG_FILE

