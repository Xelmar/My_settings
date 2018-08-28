used=$(nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits)
all=$(nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits)
echo "$(($used*100/$all))%"
