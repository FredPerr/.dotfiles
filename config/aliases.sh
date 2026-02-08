p() {
  # 1. fd: Find directories, ignore those starting with _, depth 1
  # 2. perl: Colorize the prefix (before _ or -) with Cyan
  # 3. fzf: Display beautiful UI with --ansi to support perl colors
  local project=$(fd . ~/projects --max-depth 1 --type d --exclude "_*" --exec basename | perl -pe '
    # Colorize prefix before _ or - in Cyan (\e[36m)
    if (s/^([^_|-]+)([_|-])/\e[36m$1\e[0m$2/) { } 
    # Colorize standalone projects in Green (\e[32m)
    else { s/^([a-zA-Z0-9]+)/\e[32m$1\e[0m/ }
  ' | fzf --height 40% \
          --ansi \
          --layout=reverse \
          --border \
          --prompt="📂 Project > " \
          --header="Search projects (Excluding _*)")

  # Strip ANSI color codes before using the variable
  local clean_project=$(echo "$project" | sed 's/\x1b\[[0-9;]*m//g')

  if [ -n "$clean_project" ]; then
    local project_path="$HOME/projects/$clean_project"
    echo "Opening $clean_project..."
    code "$project_path"
    cd "$project_path"
  fi
}