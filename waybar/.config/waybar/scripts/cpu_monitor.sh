#!/bin/bash

CPU_TEMP=$(sensors | grep -m 1 'Tctl' | awk '{print $2}' | sed 's/+//')
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | xargs printf "%5.1f")  # padding to 5 characters

echo "{\"text\":\"${CPU_USAGE}%\",\"tooltip\":\"CPU Usage: ${CPU_USAGE}%\\nCPU Temperature: ${CPU_TEMP}\"}"
