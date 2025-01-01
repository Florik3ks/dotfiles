#!/bin/sh

cmd="--format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}'"
echo $cmd + "test"

player_status=$(playerctl status 2> /dev/null)
if [ "$player_status" = "Playing" ]; then
    echo "$(playerctl metadata artist) - $(playerctl metadata title)"
# elif [ "$player_status" = "Paused" ]; then
#     echo " $(playerctl metadata artist) - $(playerctl metadata title)"
fi