#!/bin/sh

git config --global user.name "x1nyuan"
git config --global user.email "yao.ntno@gmail.com"
git config --global push.default simple

git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false
git config --global mergetool.keepBackup false
