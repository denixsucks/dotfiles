#!/bin/sh
yes | cp -Ri ./.config $HOME/ 2>/dev/null
cp ./.Xdefaults $HOME/.Xdefaults
cp ./.xinitrc $HOME/.xinitrc
