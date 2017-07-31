#!/bin/sh
cd vimrc
sh link.sh
cd ../

ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/vimperatorrc ~/.vimperatorrc

rm -rf ~/.pandoc
ln -sf ~/.dotfiles/pandoc ~/.pandoc
cp -f ./.gitconfig ~/.gitconfig




if [ ! -e ~/.ssh/ ]; then
    echo "no dir"
    mkdir ~/.ssh
fi
ln -sf ~/.dotfiles/ssh/config ~/.ssh/config
cat ~/.dotfiles/ssh/authorized_keys >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
