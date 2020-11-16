#!/usr/bin/env bash

# $1: option
# $2: default value
tmux_get() {
    local value="$(tmux show -gqv "$1")"
    [ -n "$value" ] && echo "$value" || echo "$2"
}

# $1: option
# $2: value
tmux_set() {
    tmux set-option -gq "$1" "$2"
}

# Icons
right_arrow_icon=$(tmux_get '@tmux_power_right_arrow_icon' '')
left_arrow_icon=$(tmux_get '@tmux_power_left_arrow_icon' '')

# Colors
white='#f8f8f2'
gray='#454158'
dark_gray='#22212c'
light_purple='#9580ff'
dark_purple='#7970a9'
cyan='#80ffea'
green='#8aff80'
orange='#ffca80'
red='#ff9580'
pink='#ff80bf'
yellow='#ffff80'

FG="$white"
BG="$dark_gray"

# Status options
tmux_set status-interval 1
tmux_set status on

# Basic status bar colors
tmux_set status-fg "$FG"
tmux_set status-bg "default"
tmux_set status-attr none

# tmux-prefix-highlight
tmux_set @prefix_highlight_fg "default"
tmux_set @prefix_highlight_bg "default"
tmux_set @prefix_highlight_prefix_prompt "#[fg=$green]#[bg=default]$left_arrow_icon#[fg=$BG]#[bold]#[bg=$green] ⌃B #[fg=$gray]#[bg=$green]#[none]$left_arrow_icon#[fg=default]#[bg=$gray]"
tmux_set @prefix_highlight_show_copy_mode 'on'
tmux_set @prefix_highlight_copy_prompt "#[fg=$yellow]#[bg=default]$left_arrow_icon#[fg=$BG]#[bg=$yellow] ⌘C #[fg=$gray]#[bg=$yellow]$left_arrow_icon#[fg=default]#[bg=$gray]"
tmux_set @prefix_highlight_copy_mode_attr "fg=default,bg=default,bold"
tmux_set @prefix_highlight_output_prefix ''
tmux_set @prefix_highlight_output_suffix ''
tmux_set @prefix_highlight_empty_prompt "#[fg=$gray]#[bg=default]$left_arrow_icon#[fg=$FG]#[bg=$gray] "
tmux_set @prefix_highlight_empty_attr "fg=default,bg=default,none"

# host keys
host_keys_prompt="#[fg=$red]#[bg=default]$left_arrow_icon#[fg=$BG]#[bg=$red] ⌨ #[fg=$gray]#[bg=$red]$left_arrow_icon#[fg=$FG]#[bg=$gray] "
host_keys="#{?#{==:#{client_key_table},off},$host_keys_prompt,#{prefix_highlight}}"

#     
# Left side of status bar
tmux_set status-left-bg "$BG"
tmux_set status-left-fg "$FG"
tmux_set status-left-length 1000
user=$(whoami)
LS="#[fg=$BG,bg=$green,bold] ❐ #S #[fg=$green,bg=$BG,none]$right_arrow_icon#[fg=$FG,bg=$BG,none]"
tmux_set status-left "$LS"

# Right side of status bar
tmux_set status-right-bg "$BG"
tmux_set status-right-fg "$FG"
tmux_set status-right-length 1000
RS="$host_keys#[fg=$FG,bg=$gray]%b %d %I:%M %p #[fg=$pink,bg=$gray]$left_arrow_icon#[fg=$BG,bg=$pink] $user #[fg=$cyan,bg=$pink]$left_arrow_icon#[fg=$BG,bg=$cyan,bold] #h "
tmux_set status-right "$RS"

# Window status
tmux_set window-status-format "#[fg=$FG,bg=$BG] #I #W "
tmux_set window-status-current-format "#[fg=$BG,bg=$light_purple]$right_arrow_icon#[fg=$FG,bg=$light_purple,bold] #I #W #[fg=$light_purple,bg=$BG,nobold]$right_arrow_icon"

# Window separator
tmux_set window-status-separator ""

# Window status alignment
tmux_set status-justify left

# Current window status
tmux_set window-status-current-statys "fg=$FG,bg=$dark_purple"

# Pane border
tmux_set pane-border-style "fg=$gray,bg=default"

# Active pane border
tmux_set pane-active-border-style "fg=$cyan,bg=default"

# Pane number indicator
tmux_set display-panes-colour "default"
tmux_set display-panes-active-colour "$cyan"

# Clock mode
tmux_set clock-mode-colour "$light_purple"
tmux_set clock-mode-style 12

# Message
tmux_set message-style "fg=$BG,bg=$cyan"

# Command message
tmux_set message-command-style "fg=$BG,bg=$cyan"

# Copy mode highlight
tmux_set mode-style "fg=$FG,bg=$gray"
