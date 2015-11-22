#!/bin/sh
git config --global user.name "x1nyuan"
git config --global user.email "yao.ntno@gmail.com"
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.bashrc ~/.bashrc
rm -rf ~/.config/xfce4
ln -sf ~/.dotfiles/config/xfce4 ~/.config/xfce4
rm -rf ~/.config/Thunar
ln -sf ~/.dotfiles/config/Thunar ~/.config/Thunar
