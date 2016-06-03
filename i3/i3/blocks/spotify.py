#!/usr/bin/python

import dbus
try:
    bus = dbus.SessionBus()
    spotify = bus.get_object("org.mpris.MediaPlayer2.spotify", "/org/mpris/MediaPlayer2")
    spotify_iface = dbus.Interface(spotify, 'org.freedesktop.DBus.Properties')
    props = spotify_iface.Get('org.mpris.MediaPlayer2.Player', 'Metadata')
    spotify_string = str(props['xesam:artist'][0]) + " - " + str(props['xesam:title'])
    if len(spotify_string) > 45:
        spotify_string = spotify_string[:45]+"~"
    print spotify_string
    exit
except dbus.exceptions.DBusException:
    exit



