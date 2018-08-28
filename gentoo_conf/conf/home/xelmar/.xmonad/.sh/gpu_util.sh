echo "$(nvidia-settings -tq GPUUtilization | awk -F '[,= ]' '{ print $2 }')%"
