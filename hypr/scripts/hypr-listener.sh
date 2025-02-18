#!/usr/bin/env bash

close_special_on_workspace_change(){
  active=$(hyprctl -j monitors | jq --raw-output '.[] | select(.focused==true).specialWorkspace.name | split(":") | if length > 1 then .[1] else "" end')

  if [[ ${#active} -gt 0 ]]; then
      hyprctl dispatch togglespecialworkspace "$active"
  fi
}

handle() {
  case $1 in
    workspace*) close_special_on_workspace_change ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done