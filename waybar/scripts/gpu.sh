#!/bin/sh

utilization=$(nvidia-smi --query-gpu utilization.gpu --format=csv,noheader 2> /dev/null)
temp=$(nvidia-smi --query-gpu temperature.gpu --format=csv,noheader 2> /dev/null)


cut=$(echo ${utilization::-1})
echo  $cut% GPU
