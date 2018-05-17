#!/bin/sh

#  install.sh
#  RemoveOldTimeMachine
#
#  Created by Andrew Romanov on 17/05/2018.
#  Copyright © 2018 Andrew Romanov. All rights reserved.

SCRIPT_DIRECTORY="$(dirname $0)"
cp $SCRIPT_DIRECTORY/RunBackup.sh ~/autorunScripts/timeMashine/RunBackup.sh

