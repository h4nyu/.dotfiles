!/bin/bash
sudo -E apt-get -y install tmux
sudo -E apt-get -y install zsh
sudo -E apt-get -y install vim-nox
sudo -E apt-get -y install silversearcher-ag
chsh -s $(`which zsh`) $USER


./exit_root.sh

ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/ignore ~/.ignore
ln -sf ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/vim ~/.vim

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/Shougo/dein.vim ~/.vim/dein/repos/github.com/Shougo/dein.vim

exit
