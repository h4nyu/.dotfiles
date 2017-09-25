#!/bin/sh

cp ~/.dotfiles/tmux.conf ~/.tmux.conf
cp ~/.dotfiles/bashrc ~/.bashrc
cp ~/.dotfiles/profile ~/.profile
cp ~/.dotfiles/vimperatorrc ~/.vimperatorrc

rm -rf ~/.pandoc
ln -sf ~/.dotfiles/pandoc ~/.pandoc




if [ ! -e ~/.ssh/ ]; then
    echo "no dir"
    mkdir ~/.ssh
fi
ln -sf ~/.dotfiles/ssh/config ~/.ssh/config
cp ~/.dotfiles/ssh/authorized_keys  ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
