#!/bin/sh
git config --global user.name "x1nyuan"
git config --global user.email "yao.ntno@gmail.com"
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.bashrc ~/.bashrc

rm -rf ~/.pandoc
ln -sf ~/.dotfiles/.pandoc ~/.pandoc

rm -rf ~/.config/lxterminal
ln -sf ~/.dotfiles/.config/lxterminal ~/.config/lxterminal

rm -rf ~/.config/lxsession
ln -sf ~/.dotfiles/.config/lxsession ~/.config/lxsession
