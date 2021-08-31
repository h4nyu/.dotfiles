#!/bin/bash
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/init.vim ~/.vimrc

mkdir -p ~/.config/fish/
ln -sf ~/.dotfiles/config.fish ~/.config/fish/config.fish

mkdir -p ~/.config/nvim
ln -sf ~/.dotfiles/init.vim ~/.config/nvim/init.vim

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [ ! -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi
