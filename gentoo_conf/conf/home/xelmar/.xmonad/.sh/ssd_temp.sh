sudo nvme smart-log /dev/nvme0 | grep temperature | awk '{print $3/1;}'
