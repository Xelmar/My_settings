setxkbmap -layout "us,ru"
setxkbmap -option "grp:caps_toggle,grp_led:scroll"

xsetroot -cursor_name left_ptr &

export PATH=~/bin:$PATH

feh --bg-scale /home/xelmar/Pictures/wall.jpg

exec dbus-launch xmonad
