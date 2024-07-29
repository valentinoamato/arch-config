#!/bin/bash

#Set Zsh as default shell
chsh -s /usr/bin/zsh

#Set Oh My Zsh theme
zsh -c "source $HOME/.zshrc; omz theme set agnoster"

#Apply basic UFW configuration https://wiki.archlinux.org/title/Uncomplicated_Firewall#Basic_configuration
sudo ufw default deny
sudo ufw allow from 192.168.0.0/24
sudo ufw limit ssh
sudo ufw enable
