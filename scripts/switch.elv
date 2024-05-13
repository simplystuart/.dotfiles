#!/usr/bin/env elvish

# Check if exactly one argument is provided
if (eq (count $args) 1) {
  project-dir = $args[0]
} else {
  # Fuzzy find a directory
  project-dir = (find ~/Projects -mindepth 1 -maxdepth 1 -type d | fzf)
}

# Exit if no directory is chosen or found
if (eq $project-dir '') {
  put 'No project directory specified.' >&2
  exit 0
}

# Transform project directory name for use in tmux
project = (basename $project-dir | tr . _)

# Start tmux session if not in tmux and no tmux process is found
if (and (eq $TMUX '') (not (has-external pgrep tmux))) {
  e:tmux new-session -s $project -c $project-dir
  exit 0
}

# Check if tmux session exists, and create it if not
try {
  e:tmux has-session -t=$project
} except {
  e:tmux new-session -ds $project -c $project-dir
}

# Switch to the tmux session
e:tmux switch-client -t $project

