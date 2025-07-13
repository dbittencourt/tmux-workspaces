#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# session switcher mapped to alt + `
tmux bind -n 'M-`' display-popup -E "$CURRENT_DIR/scripts/new-session.sh"

# alt+1/2/3/4 switch to window 1/2/3/4
tmux bind -n M-1 select-window -t 1
tmux bind -n M-2 select-window -t 2
tmux bind -n M-3 select-window -t 3
tmux bind -n M-4 select-window -t 4
