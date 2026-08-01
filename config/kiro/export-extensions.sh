#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
kiro --list-extensions | sort > "$SCRIPT_DIR/extensions.txt"
echo "Kiro extensions exported to $SCRIPT_DIR/extensions.txt"
