#!/bin/sh
dwmstatus &
xbindkeys
setxkbmap -option caps:escape
exec dwm
