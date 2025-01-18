#!/bin/bash

echo ""
# Router preparation
sleep 5m

# Make sure wifi is connected
echo "Checking Wifi connection..."
sudo dhclient wlan0
if [ $? -ne 0 ]
then
  echo "Wifi is not connected."
  exit 1
fi
echo "Wifi is connected."

# Execute...

cd ~/Documents/netAuth
echo "Login time BEFORE time SYNC is: $(date +"%c")"

# Authencation
./srun login -c config.json
if [ $? -ne 0 ]
then
  echo "Authencation failed."
  exit 1
fi
echo "Authencation successful."

# Sync time
echo "Syncing system time..."
sudo ntpdate edu.ntp.org.cn
if [ $? -ne 0 ]
then
  echo "Time sycing failed."
  exit 1
fi
echo "Time syncing successful."
echo "Login time AFTER time SYNC is: $(date +"%c")"

