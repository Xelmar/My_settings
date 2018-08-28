echo "$(nvidia-settings -tq GPUCoreTemp | awk 'END {print $1/1;}')°C"
