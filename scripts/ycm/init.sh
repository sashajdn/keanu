#!/bin/bash
### Install YouCompleteMe


sudo pacman -S cmake go go-tools
mkdir -p ~/.vim/plugged
git clone git@github.com:ycm-core/YouCompleteMe.git ~/.vim/bundle
cd ~/.vim/bundle && git submodule --init --recursive && python ./install.py --all
