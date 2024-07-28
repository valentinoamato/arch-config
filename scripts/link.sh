#!/bin/bash

#Create the .config folder
mkdir -p $HOME/.config 

#Symlink user configuration
cd ../config
stow user -t $HOME
