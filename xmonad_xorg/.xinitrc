setxkbmap -layout "us,ru"
setxkbmap -option "grp:caps_toggle,grp_led:scroll"

xsetroot -cursor_name left_ptr &

export PATH=~/bin:$PATH

feh --bg-scale /home/xelmar/Pictures/35Lun7R.jpg
exec mkfifo /tmp/.volume-pipe

exec dbus-launch xmonad
