#!/bin/bash

# This script is used to boot the system again when .bootagain file is detected in $HOME
# If .bootagain file is detected, the script will remove the file and reboot the system
# If .bootagain file is not detected, the script will create the file and then do nothing

# First sleep for 30 seconds to ensure that the system is fully booted
sleep 30

# Check if .bootagain file is detected
if [ -f $HOME/.bootagain ]; then
  # Remove the file
  rm $HOME/.bootagain
  # Reboot the system
  reboot
fi

# Create the file
touch $HOME/.bootagain

# Exit
exit 0
