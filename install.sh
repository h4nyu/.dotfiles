#!/bin/bash
sudo -E apt-get -y install tmux 
sudo -E apt-get -y install vim-nox

./exit_root.sh

ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/vim ~/.vim

cd ~/.vim
sh install.sh

exit
