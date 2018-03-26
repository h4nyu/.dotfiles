#!/bin/bash
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/ignore ~/.ignore
ln -sf ~/.dotfiles/vim/.vimrc ~/.vimrc

if [ ! -f ~/.vim ]; then
    ln -sf ~/.dotfiles/vim ~/.vim
fi


if [ ! -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

if [ ! -d ~/.dotfiles/vim/dein ]; then
    git clone https://github.com/Shougo/dein.vim ~/.vim/dein/repos/github.com/Shougo/dein.vim
fi
