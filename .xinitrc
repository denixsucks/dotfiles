#!/bin/sh
export QT_QPA_PLATFORMTHEME="qt5ct"
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
if [ -d $HOME/bin ]; then
	export PATH="$HOME/bin:$PATH"
fi
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [ -f $usermodmap	]; then
    xmodmap $usermodmap
else
	xmodmap $sysmodmap
fi

if [ -e /sys/class/power_supply/BAT0 ]; then
    export IS_LAPTOP=$true
fi

export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons
# see https://unix.stackexchange.com/a/295652/332452
# source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# see https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# see https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
mkdir -p "$HOME"/.local/share/keyrings

/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &
pulsemixer --unmute &
picom -b & # --experimental-backends for blur
nm-applet &
udiskie --smart-tray &
nitrogen --restore &
setxkbmap -layout us,tr -option grp:alt_caps_toggle -option caps:none &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &




exec awesome
