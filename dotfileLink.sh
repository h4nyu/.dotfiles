#!/bin/sh
curl -kL https://raw.github.com/cstrap/monaco-font/master/install-font-ubuntu.sh | bash
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.bashrc ~/.bashrc
rm -rf ~/.config/xfce4
ln -sf ~/.dotfiles/config/xfce4 ~/.config/xfce4
