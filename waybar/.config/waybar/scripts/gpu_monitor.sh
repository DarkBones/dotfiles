#!/bin/bash

# Get GPU utilization percentage
GPU_USAGE=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | xargs printf "%5.1f")  # padding to 5 characters

# Get additional stats for tooltip
GPU_TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)
GPU_POWER=$(nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits | xargs printf "%.1f")
GPU_MEM_USED=$(nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits)
GPU_MEM_TOTAL=$(nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits)

echo "{\"text\":\"${GPU_USAGE}%\",\"tooltip\":\"GPU Usage: ${GPU_USAGE}%\\nTemperature: ${GPU_TEMP}°C\\nPower Draw: ${GPU_POWER}W\\nMemory: ${GPU_MEM_USED}MB / ${GPU_MEM_TOTAL}MB\"}"
