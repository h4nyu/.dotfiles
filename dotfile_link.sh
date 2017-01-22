#!/bin/sh

sh ./exit_root.sh

git config --global user.name "x1nyuan"
git config --global user.email "yao.ntno@gmail.com"
git config --global push.default simple

ln -sf ~/.dotfiles/vimrc/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/vimperatorrc ~/.vimperatorrc

rm -rf ~/.pandoc
ln -sf ~/.dotfiles/pandoc ~/.pandoc


if [ ! -e ~/.ssh/ ]; then
    echo "no dir"
    mkdir ~/.ssh
fi
rm -rf ~/.ssh/config
ln -sf ~/.dotfiles/ssh/config ~/.ssh/config
ln -sf ~/.dotfiles/ssh/authorized_keys ~/.ssh/authorized_keys
