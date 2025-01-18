#!/bin/bash

# This script is used to enable the user service

# First create the service file in ~/.config/systemd/user/
serviceFolder="$HOME/.config/systemd/user/"
# Check if the directory exists
if [ ! -d $serviceFolder ]; then
  # Create the directory
  mkdir -p $serviceFolder
fi

# Copy the script to the service folder
cp boot-again.sh $serviceFolder

# Create the service file
cat > $serviceFolder/boot-again.service << EOL
[Unit]
Description=[Boot Again Service]

[Service]
Type=simple
StandardOutput=journal
ExecStart=$HOME/.config/systemd/user/boot-again.sh

[Install]
WantedBy=default.target
EOL

# Check if the service file is created
echo "Checking if the service file is created..."
cat $serviceFolder/boot-again.service

# Enable the service
echo "Enabling the service..."
systemctl --user enable boot-again.service

# Check if the service is enabled
isEnabled=$(systemctl --user is-enabled boot-again.service)
echo "Is the service enabled? $isEnabled"

# Start the service
echo "Starting the service..."
systemctl --user start boot-again.service

# Check the status of the service
echo "Checking the status of the service..."
systemctl --user status boot-again.service
