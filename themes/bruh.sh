#!/bin/sh
xrdb -load ~/.Xresources
python ~/themes/scripts/alacritty.py
echo 'awesome.restart()' | awesome-client
nitrogen --restore
