#!/bin/bash

#Copy background to be used by lightdm greeter
sudo cp ../media/backgrounds/arch-boolean.jpg /usr/share/pixmaps/arch-boolean.jpg

#Copy lightdm-gtk-greeter.conf
sudo mkdir -p /etc/lightdm/
sudo cp ../config/system/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
