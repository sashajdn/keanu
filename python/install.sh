#!/bin/sh

#
## Python environment install scripts
## Assumes the latest version of python
## installed as part of OS
#

sudo pacman -S python-pip
pip install ipython --user  ## system-wide ipython
