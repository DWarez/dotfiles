#!/bin/bash

# Check if Albert is already open
if hyprctl clients | grep -q "class: albert"; then
  # If open, just focus it
  hyprctl dispatch focuswindow "^(albert)$"
else
  # Store current setting
  current_fm=$(hyprctl getoption input:follow_mouse | grep "int: " | awk '{print $2}')

  # Disable follow_mouse
  hyprctl keyword input:follow_mouse 0

  # Open Albert
  albert show

  # Wait and focus
  sleep 0.1
  hyprctl dispatch focuswindow "^(albert)$"

  # Monitor for Albert closing and restore setting
  (
    while hyprctl clients | grep -q "class: albert"; do
      sleep 0.2
    done
    hyprctl keyword input:follow_mouse $current_fm
  ) &
fi
