#!/bin/bash
sudo -E apt-get -y install tmux 
sudo -E apt-get -y install vim-nox

./exit_root.sh

ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/vim ~/.vim
ln -sf ~/.dotfiles/vim/.vimrc ~/.vimrc

git clone https://github.com/Shougo/dein.vim ~/.vim/dein/repos/github.com/Shougo/dein.vim
vim  -c "q" 

exit
