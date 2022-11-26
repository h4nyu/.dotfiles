#!/bin/bash

ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/init.vim ~/.vimrc

mkdir -p ~/.config/fish
ln -sf ~/.dotfiles/config.fish ~/.config/fish/config.fish
ln -sf ~/.dotfiles/fish_plugins ~/.config/fish/fish_plugins

mkdir -p ~/.config/nvim
ln -sf ~/.dotfiles/init.vim ~/.config/nvim/init.vim

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [ ! -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi


if [ ! -d ~/.bash_completion.d ]; then
    mkdir -p ~/.bash_completion.d
fi
curl -L https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/bash/docker-compose -o ~/.bash_completion.d/docker-compose

git config --global mergetool.vimdiff.cmd 'nvim -d -c "wincmd l" "$LOCAL" "$MERGED" "$REMOTE"'
git config --global mergetool.keepBackup false
git clone --depth 1 --recursive https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
rm -rf ble.sh
