#!/bin/sh

sh ./exit_root.sh

git config --global user.name "x1nyuan"
git config --global user.email "yao.ntno@gmail.com"
git config --global push.default simple
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/bashrc ~/.bashrc

rm -rf ~/.pandoc
ln -sf ~/.dotfiles/pandoc ~/.pandoc

