#!/bin/sh
setxkbmap -layout "us,ru"
setxkbmap -option "grp:ctrl_alt_toggle,grp_led:scroll"

xsetroot -cursor_name left_ptr &

#export PATH=~/bin:$PATH
#export PATH=/opt/intel/bin:$PATH

export _volume_pipe=/tmp/.volume-pipe
[[ -S $_volume_pipe ]] || mkfifo $_volume_pipe

xrdb ~/.Xresources

synclient tapbutton1=1
xfce4-power-manager &

xrandr --setprovideroutputsource modesetting NVIDIA-0 
xrandr --auto 

feh --randomize --bg-scale ~/Wallpapper/real/07.18/*
perl ~/src/nvme/smartlog.pl &

exec ck-launch-session dbus-launch --sh-syntax --exit-with-session xmonad
