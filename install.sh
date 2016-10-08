#!/bin/sh

sudo apt-get update 
sudo apt-get upgrade -y
suda apt-get autoremove
sudo apt-get -y install curl 
sudo apt-get -y install vim-nox 
sudo apt-get -y install pandoc
sudo apt-get -y install python-pip 
sudo apt-get -y install python3-pip 
sudo apt-get -y install clang
sudo apt-get -y install exuberant-ctags

# python packege
sudo pip install flake8 autopep8

exit
