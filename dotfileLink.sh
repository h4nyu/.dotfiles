#!/bin/sh
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.bashrc ~/.bashrc
rm -rf ~/.config/xfce4
ln -sf ~/.dotfiles/config/xfce4 ~/.config/xfce4
