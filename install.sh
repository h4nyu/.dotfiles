#!/bin/sh

sudo apt-get update 
sudo apt-get -y upgrade
sudo apt-get -y install curl 
sudo apt-get -y install aptitude 
sudo apt-get -y install vim-gtk 
sudo apt-get -y install ibus-mozc 
sudo apt-get -y install pandoc
sudo apt-get -y install python-pip 
sudo apt-get -y install pepperflashplugin-nonfree
sudo apt-get -y install skype


# monaco font for programing
sudo cp -r monaco /usr/share/fonts/truetype

exit
