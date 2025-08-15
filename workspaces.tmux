#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# alt + n to open plugin popup
tmux bind -n M-n display-popup -E "$CURRENT_DIR/scripts/new-session.sh"

# alt + r to reset windows
tmux bind -n M-r run-shell "$CURRENT_DIR/scripts/reset-windows.sh"

# alt + ` to swap between current and last session
tmux bind -n 'M-`' switch-client -l

# alt+1/2/3/4 switch to window 1/2/3/4
tmux bind -n M-1 select-window -t 1
tmux bind -n M-2 select-window -t 2
tmux bind -n M-3 select-window -t 3
tmux bind -n M-4 select-window -t 4
