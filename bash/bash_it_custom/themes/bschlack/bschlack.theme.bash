#!/usr/bin/env bash

# prompt themeing

#added TITLEBAR for updating the tab and window titles with the pwd
case $TERM in
	xterm*)
	TITLEBAR="\[\033]0;\w\007\]"
	;;
	*)
	TITLEBAR=""
	;;
esac

function prompt_command() {
	local ret_status="$( [ $? -eq 0 ] && echo -e "${bold_green}" || echo -e "${bold_red}")"
	local root_status="$( [ $UID -eq 0 ] && echo -e "${bold_yellow}" || echo -e "${normal}")"
	PS1="${ret_status}❯${reset_color} ${bold_orange}\h${reset_color}@${reset_color}${bold_green}\u${reset_color} \[$(scm_prompt_info)\]${bold_blue}\W ${root_status}\$${reset_color}${normal} "
}

# scm themeing
SCM_THEME_PROMPT_DIRTY=" ${bold_yellow}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✔"
SCM_THEME_PROMPT_PREFIX="${bold_cyan}("
SCM_THEME_PROMPT_SUFFIX="${bold_cyan})${reset_color} "

safe_append_prompt_command prompt_command
