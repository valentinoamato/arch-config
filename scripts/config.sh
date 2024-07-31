#!/bin/bash

#Set Zsh as default shell
chsh -s /usr/bin/zsh

#Apply basic UFW configuration https://wiki.archlinux.org/title/Uncomplicated_Firewall#Basic_configuration
sudo ufw default deny
sudo ufw allow from 192.168.0.0/24
sudo ufw limit ssh
sudo ufw enable
