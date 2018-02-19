#!/bin/bash
sudo -E apt-get -y install tmux 
sudo -E apt-get -y install vim-nox

./exit_root.sh

cp ~/.dotfiles/tmux.conf ~/.tmux.conf
cp ~/.dotfiles/bashrc ~/.bashrc
cp -r ~/.dotfiles/vim ~/.vim
cd ~/.vim
sh install.sh

exit
