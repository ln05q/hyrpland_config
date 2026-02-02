#!/bin/bash

sleep 0.5  # wait for Hyprland to initialize

hyprctl dispatch workspace 2  # switch to workspace 2
sleep 0.1
firefox &                    # launch Firefox

