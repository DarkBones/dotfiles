#!/bin/bash

DATE=$(date +'%a %d')
TIME=$(date +'%H:%M')
MONTH_YEAR=$(date +'%Y %B')
CALENDAR=$(cal --color=never | sed 's/\x1b\[[0-9;]*m//g' | sed ':a;N;$!ba;s/\n/\\n/g')

echo "{\"text\": \"󰸗  ${DATE} | ${TIME}\", \"tooltip\": \"<big>${MONTH_YEAR}</big>\\n<tt><small>${CALENDAR}</small></tt>\"}"
