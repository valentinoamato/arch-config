#!/bin/bash

#Install pacman packages
packages=$(cat ../packages/pacman/list.txt)
sudo pacman -S $packages --needed