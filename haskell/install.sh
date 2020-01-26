#!/bin/sh

#
## Install Haskell and all dependencies
#

echo "Installing Haskell..."
sudo pacman -S ghc cabal-install stack  ## Install haskell & env

[[ !-d  ~/.cabal ]] && mkdir "~/.cabal"
