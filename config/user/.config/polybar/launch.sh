#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar in all monitors, using default config location ~/.config/polybar/config.ini
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar example 2>&1 | tee -a /tmp/polybar.log & disown
  done
else
  polybar example 2>&1 | tee -a /tmp/polybar.log & disown
fi
echo "Polybar launched..."
