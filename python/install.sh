#!/bin/sh

#
## Python environment install scripts
## Assumes the latest version of python
## installed as part of OS
#

sudo pacman -S python-pip
pip install ipython pylint flake8 --user  ## system-wide ipython
