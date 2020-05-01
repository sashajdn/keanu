#!/bin/sh

### --- toggle symlink --- ###
if [ ! -d /opt/lifx ]; then
	sudo mkdir /opt/lifx;
fi
sudo ln -sf $HOME/keanu/lifx/commands/toggle.sh /opt/lifx/toggle.sh


### --- conf symlink --- ###
if [ ! -d /etc/lifx ]; then
	sudo mkdir /etc/lifx;
fi
sudo ln -sf $HOME/keanu/lifx/lifx.conf /etc/lifx/lifx.conf
