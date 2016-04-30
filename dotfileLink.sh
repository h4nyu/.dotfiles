#!/bin/sh
git config --global user.name "x1nyuan"
git config --global user.email "yao.ntno@gmail.com"
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.bashrc ~/.bashrc

DIR=~/.vnc

if [ -d ${DIR} ]; then
    echo "folder exists"
else
    mkdir ~/.vnc
fi

ln -sf ~/.dotfiles/.vnc/xstartup ~/.vnc/xstartup
rm -rf ~/.config/xfce4
ln -sf ~/.dotfiles/config/xfce4 ~/.config/xfce4
rm -rf ~/.config/Thunar
ln -sf ~/.dotfiles/config/Thunar ~/.config/Thunar
rm -rf ~/.pandoc
ln -sf ~/.dotfiles/.pandoc ~/.pandoc
