p() {
  # 1. Get the list and store it in a variable so we can process it twice
  local project_list=$(fd . ~/projects --max-depth 1 --type d --exclude "_*" --exec basename)
  
  # 2. Use Perl to count occurrences, then color only the groups
  local project=$(echo "$project_list" | perl -e '
    my @lines = <>;
    my %counts;
    my @colors = ("\e[36m", "\e[35m", "\e[33m", "\e[34m", "\e[32m", "\e[31m"); # Cyan, Mag, Yel, Blu, Grn, Red
    
    # First pass: Count prefixes
    foreach (@lines) {
        my ($prefix) = /^([^-|_]+)/;
        $counts{$prefix}++ if $prefix;
    }
    
    # Second pass: Print with color only if count > 1
    foreach (@lines) {
        chomp($_);
        my ($prefix, $suffix) = /^([^-|_]+)([-|_].*)?$/;
        
        if ($prefix && $counts{$prefix} > 1) {
            # Assign color based on prefix hash
            my $hash = 0;
            foreach (split //, $prefix) { $hash = ($hash + ord($_)) }
            my $color = $colors[$hash % @colors];
            print "$color$prefix\e[0m$suffix\n";
        } else {
            print "$_\n";
        }
    }
  ' | fzf --height 40% \
          --ansi \
          --layout=reverse \
          --border \
          --prompt="📂 Project > " )

  # 3. Clean and Open
  local clean_project=$(echo "$project" | sed 's/\x1b\[[0-9;]*m//g')

  if [ -n "$clean_project" ]; then
    local project_path="$HOME/projects/$clean_project"
    echo "Opening $clean_project..."
    code "$project_path"
    cd "$project_path"
    [ -n "$TMUX" ] && tmux rename-window "$clean_project"
  fi
}

# Switch git branches with fzfl (checkout)
co() {
  local branch=$(git branch --color=always | fzf --height 40% --ansi --reverse --border --prompt="🌿 Branch > ")
  if [ -n "$branch" ]; then
    # Strip the '*' and whitespace from the branch name
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s/ //g")
  fi
}

alias logs="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

# Switch between tmux sessions
tm() {
  local session=$(tmux list-sessions -F "#{session_name}" | fzf --height 40% --reverse --border --prompt="🪟 Session > ")
  if [ -n "$session" ]; then
    tmux switch-client -t "$session"
  fi
}

# 
alias ls="eza --icons --git --group-directories-first"
alias ll="eza -l --icons --git --group-directories-first"
alias tree="eza --tree --level=2"