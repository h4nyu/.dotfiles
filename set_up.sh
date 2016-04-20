#!/bin/sh
sudo apt-get -y install curl 
sudo apt-get -y install aptitude 
sudo apt-get -y install vim-gtk 
sudo apt-get -y install ibus-mozc 
sudo apt-get -y install python-pip 

# monaco font for programing
curl -kL https://raw.github.com/cstrap/monaco-font/master/install-font-ubuntu.sh | sudo bash

# anaconda python
# wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.3.0-Linux-x86_64.sh

# git config 
git config --global user.name "x1nyuan"
git config --global user.email yao.ntno@gmail.com

sh ./dotfileLink.sh
echo setup finished


