#!/bin/sh

max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
current_brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
change=$1
null_value="0"

new_value=$(( current_brightness + change * max_brightness / 100))

if [ "$null_value" -gt "$new_value" ]; then
	new_value=0;
elif [ "$new_value" -gt "$max_brightness" ]; then
	new_value=$max_brightness;
fi

echo $new_value > /sys/class/backlight/intel_backlight/brightness 

exit 0
