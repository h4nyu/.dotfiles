#!/bin/sh
sudo add-apt-repository ppa:graphics-drivers/ppa

sudo -E apt-get update 
sudo -E apt-get -y dist-upgrade 
sudo -E apt-get -y upgrade 

suda -E apt-get autoremove
sudo -E apt-get -y install curl 
sudo -E apt-get -y install tmux 
sudo -E apt-get -y install aptitude
sudo -E apt-get -y install vim-nox
sudo -E apt-get -y install fcitx-mozc 
sudo -E apt-get -y install pandoc
sudo -E apt-get -y install python-pip 
sudo -E apt-get -y install python3-pip 
sudo -E apt-get -y install flashplugin-installer 
sudo -E apt-get -y install arandr
sudo -E apt-get -y install ctags
sudo -E apt-get -y install clang
sudo -E apt-get -y install python-wstool python-catkin-tools


# python packege
sudo -E -H pip install flake8 autopep8 jedi

exit
