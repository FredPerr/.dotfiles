#!/bin/bash

FLOATING_WORKSPACES=("4" "7")

# Get the workspace we just switched to from the environment variable
TARGET_WORKSPACE="$AEROSPACE_FOCUSED_WORKSPACE"

# Check if the current workspace is in our floating list
for ws in "${FLOATING_WORKSPACES[@]}"; do
    if [ "$TARGET_WORKSPACE" == "$ws" ]; then
        # List all windows in this workspace and force them to float
        # We use awk to get the window IDs and xargs to apply the layout
        aerospace list-windows --workspace "$TARGET_WORKSPACE" | awk '{print $1}' | xargs -I {} aerospace layout --window-id {} floating
        exit 0
    fi
done