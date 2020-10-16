#!/bin/bash

if [ ! $(pgrep "spotifyd") ]; then
	spotify
fi

spt
