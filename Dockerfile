FROM ubuntu:16.04

MAINTAINER Xinyaun Yao <yao.xinyuan@canon.co.jp>

RUN apt-get update && apt-get install -y \
    python-software-properties \
    software-properties-common 

RUN add-apt-repository ppa:jonathonf/vim

RUN apt-get update && apt-get install -y \
    git \
    sudo \
    python \
    python3 \
    python3-pip \
    tmux \
    vim-nox \
    cmake 

RUN pip3 install --upgrade pip 

RUN pip3 install cython

COPY . /root/.dotfiles
WORKDIR /root/.dotfiles/vimrc
RUN sh link.sh

WORKDIR /root/.dotfiles
# .dotfile link
RUN ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
RUN ln -sf ~/.dotfiles/bashrc ~/.bashrc

# git config
RUN sh git_config.sh
