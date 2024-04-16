#!/bin/bash

ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/init.vim ~/.vimrc

mkdir -p ~/.config/fish
ln -sf ~/.dotfiles/config.fish ~/.config/fish/config.fish
ln -sf ~/.dotfiles/fish_plugins ~/.config/fish/fish_plugins

mkdir -p ~/.config/nvim
ln -sf ~/.dotfiles/init.lua ~/.config/nvim/init.lua

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

if [ ! -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi


if [ ! -d ~/.bash_completion.d ]; then
    mkdir -p ~/.bash_completion.d
fi

git config --global mergetool.vimdiff.cmd 'nvim -d -c "wincmd l" "$LOCAL" "$MERGED" "$REMOTE"'
git config --global mergetool.keepBackup false
