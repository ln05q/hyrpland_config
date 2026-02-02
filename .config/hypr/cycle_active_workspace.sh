#!/bin/bash

#!/bin/bash

statefile="/tmp/last_workspace"

# Get list of active workspaces
workspaces=$(/usr/bin/hyprctl workspaces -j | /usr/bin/jq '.[] | select(.windows != 0) | .id' | sort -n)
ws_array=($workspaces)

# Read last workspace from file, or get current if no file
if [[ -f "$statefile" ]]; then
    last_ws=$(cat "$statefile")
else
    last_ws=$(/usr/bin/hyprctl activeworkspace | awk '{print $2}')
fi

# Find index of last workspace
idx=0
for i in "${!ws_array[@]}"; do
  if [[ "${ws_array[$i]}" == "$last_ws" ]]; then
    idx=$i
    break
  fi
done

# Calculate next index cyclically
next_idx=$(( (idx + 1) % ${#ws_array[@]} ))
next_ws=${ws_array[$next_idx]}

/usr/bin/hyprctl dispatch workspace "$next_ws"

# Save the new workspace to the statefile
echo "$next_ws" > "$statefile"
