#!/bin/bash
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/config.fish ~/.config/fish/config.fish
ln -sf ~/.dotfiles/ignore ~/.ignore
ln -sf ~/.dotfiles/vim/.vimrc ~/.vimrc

mkdir -p ~/.config/nvim
ln -sf ~/.dotfiles/vim/.vimrc ~/.config/nvim/init.vim

if [ ! -f ~/.vim ]; then
    mkdir -p ~/.vim/src
    cp ~/.dotfiles/vim/src/* ~/.vim/src
fi

curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ ! -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

