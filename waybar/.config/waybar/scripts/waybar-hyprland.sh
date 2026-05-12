#!/bin/bash
while inotifywait -e close_write ~/.config/waybar/config.jsonc ~/.config/waybar/style.css; do
    killall -SIGUSR2 waybar
done
