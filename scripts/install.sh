#!/bin/bash

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

#Install rust
rustup default stable

#Install tree-sitter cli https://github.com/tree-sitter/tree-sitter/blob/master/cli/README.md
cargo install tree-sitter-cli
