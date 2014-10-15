#!/bin/sh

# start dwm status bar
dwmstatus.fish &

# set up volume keys
xbindkeys

# remap escape on top of capslock
setxkbmap -option caps:escape

# start tiddlywiki server
tiddlywiki sync/things --server 5098 &

exec dwm
