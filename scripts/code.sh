#!/bin/zsh

#
# Emulate an IDE with tmux and nvim
#

RED='\033[0;31m'
NC='\033[0m'

directory="$1"

if [ ! -d "$directory" ]; then
    printf "${RED}You have to provide a folder to open with the IDE${NC}\n"
    exit 1
fi


if [ ! -z "$TMUX" ]; then
    echo "You can't create a tmux session inside another session. Please leave that session first"
    exit 1
fi

active_sessions="$(tmux list-session | wc -l)" # Count the number of active session

session="IDE-${active_sessions}"
window=1
tmux new-session -Ad -s $session -c $directory
tmux rename-window -t $session:$window '</>'
tmux send-keys -t $session:$window 'nvim .' Enter


window=2
tmux new-window -t $session:$window -n '~' -c $directory

window=3
tmux new-window -t $session:$window -n 'git' -c $directory
tmux send-keys -t $session:$window 'git status' C-m

tmux select-window -t $session:1 # nvim window
tmux attach-session -d -t $session
