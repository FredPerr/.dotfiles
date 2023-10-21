#!/bin/zsh

#
# Emulate an IDE with tmux and nvim
#

USER=${SUDO_USER:-$USER}
HOME="/home/${USER}"
directory="${1:-$HOME}"

red="\e[0;91m"
blue="\e[0;94m"
expand_bg="\e[K"
blue_bg="\e[0;104m${expand_bg}"
red_bg="\e[0;101m${expand_bg}"
green_bg="\e[0;102m${expand_bg}"
green="\e[0;92m"
white="\e[0;97m"
bold="\e[1m"
uline="\e[4m"
reset="\e[0m"


if [ ! -d "$directory" ]; then
    printf "${red_bg}You have to provide a folder to open with the IDE${reset}\n"
    exit 1
fi


if [ ! -z "$TMUX" ]; then
    echo "${red_bg}You can't create a tmux session inside another session. Please leave that session first ${reset}\n"
    exit 1
fi

active_sessions="$(tmux list-session | wc -l)" # Count the number of active session

session="IDE-${active_sessions}"
window=1

tmux new-session -Ad -s $session -c $directory
tmux rename-window -t $session:$window '</>'
tmux send-keys -t $session:$window 'nvim .' C-m



window=2
tmux new-window -t $session:$window -n '~' -c $directory

window=3
tmux new-window -t $session:$window -n 'git' -c $directory
tmux send-keys -t $session:$window 'git status' C-m

tmux select-window -t $session:1 # nvim window
tmux attach-session -d -t $session
