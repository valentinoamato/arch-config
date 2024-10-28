#!/bin/bash

#Create the symlinks
printf "Running link.sh..."
./link.sh

#Install packages
printf "\nRunning install.sh...\n"
./install.sh

#Run configuration commands
printf "\nRunning config.sh...\n"
./config.sh

#Copy necessary files
printf "\nRunning copy.sh...\n"
./copy.sh

#Start and enable systemd units
printf "Starting systemd units...\n"
sudo systemctl enable --now lightdm
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now ufw
sudo systemctl enable --now ntpd
