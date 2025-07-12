# session switcher mapped to alt + `
bind -n M-` display-popup -E '~/.tmux/plugins/tmux-workspaces/new-session.sh'

# alt+1/2/3/4 switch to window 1/2/3/4
bind -n M-1 select-window -t 1
bind -n M-2 select-window -t 2
bind -n M-3 select-window -t 3
bind -n M-4 select-window -t 4
