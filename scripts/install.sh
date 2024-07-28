#!/bin/bash

#Install powerline fonts https://github.com/powerline/fonts
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

#Install pacman packages
packages=$(cat ../packages/pacman/list.txt)
sudo pacman -S $packages --needed
