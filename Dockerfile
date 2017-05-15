FROM ubuntu:16.04

MAINTAINER Xinyaun Yao <yao.xinyuan@canon.co.jp>

RUN apt-get update && apt-get install -y \
    git \
    sudo \
    python3.5 \
    python3-pip \
    tmux \
    cmake \
    vim-nox 

RUN pip3 install --upgrade pip 

RUN pip3 install cython

COPY . /root/.dotfiles
WORKDIR /root/.dotfiles
RUN ./.sh


# .dotfile link
RUN ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
RUN ln -sf ~/.dotfiles/bashrc ~/.bashrc

# git config
RUN git config --global user.name "x1nyuan"
RUN git config --global user.email "yao.ntno@gmail.com"
RUN git config --global push.default simple
RUN git config --global merge.tool vimdiff
RUN git config --global merge.conflictstyle diff3
RUN git config --global mergetool.prompt false
RUN git config --global mergetool.keepBackup false
