setxkbmap -layout "us,ru"
setxkbmap -option "grp:caps_toggle,grp_led:scroll"

xsetroot -cursor_name left_ptr &

export PATH=~/bin:$PATH

feh --bg-scale /home/xelmar/Pictures/35Lun7R.jpg
export _volume_pipe=/tmp/.volume-pipe
[[ -S $_volume_pipe ]] || mkfifo $_volume_pipe

xrdb ~/.Xresources

exec dbus-launch xmonad
