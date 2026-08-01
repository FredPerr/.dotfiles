#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
code --list-extensions | sort > "$SCRIPT_DIR/extensions.txt"
echo "VS Code extensions exported to $SCRIPT_DIR/extensions.txt"
