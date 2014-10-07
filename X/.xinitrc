#!/bin/sh
dwmstatus.fish &
xbindkeys
setxkbmap -option caps:escape
exec dwm
