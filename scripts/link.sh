#!/bin/bash

#Symlink user configuration
cd ../config
stow user -t $HOME

#Symlink user fonts
cd ..
stow fonts -t $HOME/.local/share/fonts/