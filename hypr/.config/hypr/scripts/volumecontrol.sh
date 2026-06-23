#!/usr/bin/env bash

case "$1 $2" in
    "-o m") wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
    "-o i") wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+ ;;
    "-o d") wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- ;;
    "-i m") wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle ;;
esac

vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')
muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -c MUTED)

[[ $muted -eq 1 ]] && icon="󰖁" || icon="󰕾"

# notify-send "$icon" -h int:value:$vol -h string:synchronous:volume -t 1500

notify-send "$vol%  $icon" -h int:value:$vol -h string:synchronous:volume -t 500
