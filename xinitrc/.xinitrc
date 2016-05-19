#!/bin/fsh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
#sysresources=/etc/X11/xinit/.Xresources
#sysmodmap=/etc/X11/xinit/.Xmodmap

# Merge in defaults and keymaps

#if [ -f $sysresources ]; then

#    xrdb -merge $sysresources

#fi

#if [ -f $sysmodmap ]; then
#    xmodmap $sysmodmap
#fi

#if [ -f "$userresources" ]; then

#    xrdb -merge "$userresources"

#fi

#if [ -f "$usermodmap" ]; then
#    xmodmap "$usermodmap"
#fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*. ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrdb ~/.Xresources &
xbanish &
#nitrogen --restore
wallpaperd
compton -G --config ~/.config/compton/compton.conf --no-fading-openclose &
xset r rate 150 25 &
setxkbmap us -variant colemak -option ctrl:nocaps shift:both_capslock
xmodmap ~/.Xmodmapc &
caffeine &
udiskie -N -s &
dunst &
mpd &
xcape -t 170 &
keynav &
xbindkeys &
transmission-daemon &
/opt/urserver/urserver --daemon
#./bin/start_jack.sh &

exec i3
