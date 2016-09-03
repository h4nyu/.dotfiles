#!/bin/sh
git config --global user.name "x1nyuan"
git config --global user.email "yao.ntno@gmail.com"
ln -sf /home/yao/.dotfiles/.vimrc ~/.vimrc
ln -sf /home/yao/.dotfiles/.bashrc ~/.bashrc

rm -rf /home/yao/.pandoc
ln -sf /home/yao/.dotfiles/.pandoc ~/.pandoc

rm -rf /home/yao/.config/lxterminal
ln -sf /home/yao/.dotfiles/.config/lxterminal ~/.config/lxterminal

rm -rf /home/yao/.config/lxsession
ln -sf /home/yao/.dotfiles/.config/lxsession ~/.config/lxsession
