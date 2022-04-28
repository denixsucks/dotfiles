#!/bin/sh

# DOWNLOAD VARIOUS THINGS

sudo pacman -S picom awesome parcellite nitrogen betterlockscreen rofi kitty alacritty neofetch xorg-xinit

# Start X Server Script 

sudo cp ./scripts/start /bin/start


# Move Config Files to Positions

yes | cp ./.config $HOME/ 2>dev/null
cp ./Xdefaults $HOME/.Xdefaults
cp ./.xinitrc $HOME/.xinitrc
