#!/bin/sh

#
## git install and setup
#

sudo pacman -S git
git config --global user.name=$USER
git config --global user.email=$EMAIL
git config --global core.editor=$EDITOR
