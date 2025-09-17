#!/bin/bash

set -e

# this script resets the tmux session to a predefined state:
DESIRED_WINDOWS=("code" "server" "git" "ai")

delete_extra_windows() {
  local keepers=()

  # find the first instance of each desired window to keep it
  for name in "${DESIRED_WINDOWS[@]}"; do
    local keeper_id
    keeper_id=$(tmux list-windows -F "#{window_id}:#{window_name}" | grep ":$name$" | cut -d: -f1 | head -n 1)
    if [[ -n "$keeper_id" ]]; then
      keepers+=("$keeper_id")
    fi
  done

  # remove all extra windows
  local all_ids
  all_ids=$(tmux list-windows -F "#{window_id}")
  for id in $all_ids; do
    local is_keeper=false
    for keeper_id in "${keepers[@]}"; do
      if [[ "$id" == "$keeper_id" ]]; then
        is_keeper=true
        break
      fi
    done

    if ! $is_keeper; then
      tmux kill-window -t "$id"
    fi
  done
}

create_missing_windows() {
  for name in "${DESIRED_WINDOWS[@]}"; do
    # check if a window with this name already exists
    if ! tmux list-windows -F "#{window_name}" | grep -q "^$name$"; then
      # create it if it doesn't
      tmux new-window -d -n "$name"
    fi
  done
}

reorder_windows() {
  # move all desired windows to temporary high indices to avoid collisions
  local temp_index=101
  for name in "${DESIRED_WINDOWS[@]}"; do
    tmux move-window -s "$name" -t "$temp_index"
    temp_index=$((temp_index + 1))
  done

  # move them from the temporary indices to their final places
  for i in "${!DESIRED_WINDOWS[@]}"; do
    local name=${DESIRED_WINDOWS[$i]}
    local target_index=$((i + 1))
    tmux move-window -s "$name" -t "$target_index"
  done
}

delete_extra_windows
create_missing_windows
reorder_windows
tmux select-window -t 1
