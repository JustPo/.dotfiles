#!/bin/bash

# List Tmux windows and pipe to fzf for interactive selection
selected_window_index=$(tmux list-windows -F '#{window_index} #{window_name}' | fzf --reverse --header "Select a Tmux Window" --preview '')

# Extract the window index from the selection
selected_window_index=$(echo "$selected_window_index" | awk '{print $1}')

# Switch to the selected Tmux window
if [ -n "$selected_window_index" ]; then
  tmux select-window -t "$selected_window_index"
fi

