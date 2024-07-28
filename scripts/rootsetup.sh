#!/bin/bash
#Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root" >&2
  exit 1
fi

#Install essential packages
pacman -S --needed curl git networkmanager vi stow sudo

#Create a user
./createuser.sh

#Move the repo 
#This will fail if there is more than one folder in /home 
mv /root/arch-config "home/$(ls /home)"
