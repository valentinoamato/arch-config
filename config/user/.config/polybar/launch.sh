#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

#List batteries and adapters
output=$(ls -1 /sys/class/power_supply 2>/dev/null)
lines=($output)
adapter="${lines[0]:-}"
battery="${lines[1]:-}"

#Adjust the window's label length based on the screen width
screen_width=$(xrandr --query | grep " connected" | cut -d" " -f4 | cut -d"x" -f1)
title_length=$((screen_width / 40))

# Launch Polybar in all monitors, using default config location ~/.config/polybar/config.ini
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    TITLE_LENGTH=$title_length ADAPTER=$adapter BATTERY=$battery MONITOR=$m polybar example 2>&1 | tee -a /tmp/polybar.log & disown
  done
else
  ADAPTER=$adapter BATTERY=$battery polybar example 2>&1 | tee -a /tmp/polybar.log & disown
fi
echo "Polybar launched..."
