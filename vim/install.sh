#!/bin/bash
cp $(pwd)/.vimrc ~/.vimrc
cp $(pwd)/.tmux.conf ~/.tmux.conf
git clone https://github.com/Shougo/dein.vim ~/.vim/dein/repos/github.com/Shougo/dein.vim
vim  -c "q" 


