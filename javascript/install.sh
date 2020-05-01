#!/bin/sh


#
## Install javascript related packages
#


sudo pacman -S npm nodejs eslint yarn prettier
sudo yarn global add tslint typescript
