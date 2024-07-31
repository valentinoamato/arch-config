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

#Install ohmyzsh https://github.com/ohmyzsh/ohmyzsh
#Oh-my-zsh attacks .zshrc so i protect it
mv $HOME/.zshrc $HOME/.zshrclink.bak
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
#Delete the .zshrc created by ohmyzsh and restore the original
rm $HOME/.zshrc
mv $HOME/.zshrclink.bak $HOME/.zshrc

#Install pacman packages
packages=$(cat ../packages/pacman/list.txt)
sudo pacman -S $packages --needed

#Install python packages
packages=$(cat ../packages/python/list.txt)
for package in $packages; do 
    pipx install "$package"
done
