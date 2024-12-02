show_git_status() {
  local index=$1
  local icon=$(get_tmux_option "@catppuccin_git_status_icon" "")
  local color=$(get_tmux_option "@catppuccin_git_status_color" "$thm_orange")
  local text=$(get_tmux_option "@catppuccin_git_status_text" "#(~/.local/scripts/git_status.sh)")

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
