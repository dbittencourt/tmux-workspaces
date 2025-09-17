#!/bin/bash

sessions=$(tmux list-sessions -F '#S' 2>/dev/null)
fzf_result=$(echo "$sessions" | fzf --prompt="Type or select session name: " --print-query --height=10 --layout=reverse)
session="${fzf_result#*$'\n'}"
[ -z "$session" ] && session="${fzf_result%%$'\n'*}"
[ -z "$session" ] && exit 0

if tmux has-session -t "$session" 2>/dev/null; then
  tmux switch-client -t "$session" 2>/dev/null
  exit 0
fi

dir=$(fd . -td -d3 -H -E .git -E node_modules -E dist ~ | fzf --prompt='Select directory: ' --select-1 --exit-0)
[ -z "$dir" ] && exit 0
[ ! -d "$dir" ] && exit 1

tmux new-session -d -s "$session" -c "$dir" -n code
tmux new-window -t "$session:" -n server -c "$dir"
tmux new-window -t "$session:" -n git -c "$dir"
tmux new-window -t "$session:" -n ai -c "$dir"
tmux select-window -t "$session:1"
tmux switch-client -t "$session"
