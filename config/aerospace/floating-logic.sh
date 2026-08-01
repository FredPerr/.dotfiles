#!/bin/bash

FLOATING_WORKSPACES=("4" "7")

TARGET_WORKSPACE="$AEROSPACE_FOCUSED_WORKSPACE"

for ws in "${FLOATING_WORKSPACES[@]}"; do
    if [ "$TARGET_WORKSPACE" == "$ws" ]; then
        aerospace list-windows --workspace "$TARGET_WORKSPACE" | awk '{print $1}' | xargs -I {} aerospace layout --window-id {} floating
        exit 0
    fi
done
