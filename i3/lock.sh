#!/bin/bash
revert() {
    xset dpms 0 0 0
}

scrot /tmp/screen.png
convert /tmp/screen.png -scale 5% -scale 2000% /tmp/screen.png
[[ -f $1 ]] && convert /tmp/screen.png $1 -gravity center -composite -matte /tmp/screen.png
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
trap revert SIGHUP SIGINT SIGTERM
xset +dpms dpms 5 5 5
i3lock -n -i /tmp/screen.png -e -f -p default
rm /tmp/screen.png
revert
