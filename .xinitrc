#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

setxkbmap -layout us -variant altgr-intl

sxhkd &
dunst &
conky &

exec bspwm
