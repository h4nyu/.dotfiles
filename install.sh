#!/bin/bash

sudo -E apt-get update 
sudo -E apt-get -y upgrade 

suda -E apt-get autoremove
sudo -E apt-get -y install curl 
sudo -E apt-get -y install tmux 
sudo -E apt-get -y install vim-nox

sudo cp -r monaco /usr/share/fonts/truetype

./exit_root.sh

cp ~/.dotfiles/tmux.conf ~/.tmux.conf
cp ~/.dotfiles/bashrc ~/.bashrc

exit
