#!/bin/sh
echo $(id -u)
if [ "$(id -u)" = "0" ]; then
    echo "this is root user"
    echo "then exit"
    exit
elif [ "$(id -u)" != "0" ]; then
    echo "this is not root user"
    echo "this script will run"
fi

git config --global user.name "x1nyuan"
git config --global user.email "yao.ntno@gmail.com"
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.bashrc ~/.bashrc

rm -rf ~/.pandoc
ln -sf ~/.dotfiles/.pandoc ~/.pandoc

rm -rf ~/.config/lxterminal
if [ ! -e ~/.config ]; then
    echo "no dir"
    mkdir ~/.config
fi
ln -sf ~/.dotfiles/.config/lxterminal ~/.config/lxterminal

rm -rf ~/.config/lxsession
ln -sf ~/.dotfiles/.config/lxsession ~/.config/lxsession
