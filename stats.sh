#!/bin/bash
echo "CPU: $(mpstat 1 1 | awk '/Average:/ {print 100 - $NF"%"}')"
echo "RAM: $(free | awk '/Mem:/ {printf "%.1f%%", ($3/$2)*100}')"
echo "Temp. CPU: $(sensors | grep -i 'Tctl' | awk '{print $2}')"
