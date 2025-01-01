#!/bin/sh

_ps=(eww eww hyprpaper)
for _prs in "${_ps[@]}"; do
    pkill "${_prs}"
done

sleep 1

for _prs in "${_ps[@]}"; do
    exec "${_prs}" &
done

eww open bar &
eww open bar_other_monitor &

exit 0