#!/bin/sh

_ps=(eww eww hyprpaper)
for _prs in "${_ps[@]}"; do
    pkill "${_prs}"
done

sleep 1

for _prs in "${_ps[@]}"; do
    exec "${_prs}" &
done

eww open bar_other_monitor &
eww open bar &

exit 0