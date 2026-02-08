# Project Selector UI
p() {
  # 1. Find directories in ~/projects (1 level deep)
  # 2. Pipe into fzf with a nice layout
  # 3. Store the selection in a variable
  local project=$(fd . ~/projects --max-depth 1 --type d --exec basename | fzf --height 40% --layout=reverse --border --prompt="📂 Project > " --header="Select a project to open in VS Code")

  # If a selection was made
  if [ -n "$project" ]; then
    local project_path="$HOME/projects/$project"
    
    echo "Opening $project..."
    # Open in VS Code
    code "$project_path"
    
    # Optional: Also navigate your terminal there
    cd "$project_path"
  fi
}