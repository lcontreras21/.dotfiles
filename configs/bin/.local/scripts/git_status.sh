#!/usr/bin/env bash

PANE_PATH=$(tmux display-message -p -F "#{pane_current_path}")
cd $PANE_PATH

git_changes() {
  local changes=$(git diff --shortstat | sed 's/^[^0-9]*\([0-9]*\)[^0-9]*\([0-9]*\)[^0-9]*\([0-9]*\)[^0-9]*/\1;\2;\3/')
  local changes_array=(${changes//;/ })
  local untracked=$(git status --porcelain 2>/dev/null| grep -c "^??")
  local staged=$(git diff --cached --numstat | wc -l)
  local result=()

  # Number of changes staged 
  if [[ $staged != 0 ]]; then
    result+=("+$staged")
  fi

  # Number of changes not staged 
  if [[ -n ${changes_array[0]} ]]; then
    result+=("!${changes_array[0]}")
  fi
  
  # Number of untracked files
  if [[ $untracked != 0 ]]; then
    result+=("?$untracked")
  fi

  local joined=$(printf " %s" "${result[@]}")
  local joined=${joined:1}

  if [[ -n $joined ]]; then
    echo "$joined "
  fi
}

git_status() {
  local branch=$(git rev-parse --abbrev-ref HEAD)
  local changes=$(git_changes)

  if [[ -n $branch ]]; then
    printf " $branch $changes"
  fi
}

main() {
  git_status
}

main
