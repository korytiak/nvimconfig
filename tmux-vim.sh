vim() {
  local target="${1:-$PWD}"

  # Resolve absolute path to target
  if [ -e "$target" ]; then
    target=$(realpath "$target")
  else
    echo "Invalid path: $target" >&2
    return 1
  fi

  if [ -f "$target" ]; then
    nvim "$target"
  elif [ -d "$target" ]; then
    local session_name
    session_name=$(basename "$target")

    tmux new-session -s "$session_name" -d -c "$target" "nvim \"$target\" +':Ex' +redraw!"
    tmux split-window -h -p 33 -t "$session_name" -c "$target"
    tmux split-window -v -p 50 -t "$session_name" -c "$target"
    tmux select-pane -t "$session_name":0.0
    tmux attach -t "$session_name"
  else
    echo "Invalid path: $target" >&2
    return 1
  fi
}

tmux source-file ~/.config/nvim/tmux.conf
