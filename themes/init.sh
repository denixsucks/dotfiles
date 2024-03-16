#!/bin/sh
xrdb -load ~/.Xresources
./xrdb-to-alacritty/script.sh ~/.config/alacritty/alacritty.toml
echo 'awesome.restart()' | awesome-client
nitrogen --restore
