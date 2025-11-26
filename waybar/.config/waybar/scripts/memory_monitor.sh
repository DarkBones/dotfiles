#!/bin/bash

# Get memory usage percentage
MEM_USAGE=$(free | grep Mem | awk '{printf "%.1f", ($3/$2) * 100}')

# Get detailed memory info for tooltip
MEM_TOTAL=$(free -h | grep Mem | awk '{print $2}')
MEM_USED=$(free -h | grep Mem | awk '{print $3}')
MEM_FREE=$(free -h | grep Mem | awk '{print $4}')
MEM_CACHED=$(free -h | grep Mem | awk '{print $6}')

echo "{\"text\":\"${MEM_USAGE}%\",\"tooltip\":\"Memory Usage: ${MEM_USAGE}%\\nTotal: ${MEM_TOTAL}\\nUsed: ${MEM_USED}\\nFree: ${MEM_FREE}\\nCached: ${MEM_CACHED}\"}"
