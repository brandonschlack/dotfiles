#!/usr/bin/env bash
#
# Source forgit
[ -f $HOME/.forgit/forgit.plugin.sh ] && source $HOME/.forgit/forgit.plugin.sh
# Source fzf-marks
[ -f $BASH_IT_CUSTOM/plugins/fzf-marks/fzf-marks.plugin.bash ] && source $BASH_IT_CUSTOM/plugins/fzf-marks/fzf-marks.plugin.bash

# User specific aliases and functions
alias sudo='sudo '
alias wtc="curl -s 'http://whatthecommit.com/' | grep '<p>' | cut -c4-"

## Edit Configs ##
alias edit_profile="vim ~/.bash_profile"
alias edit_alias="vim ~/.bashrc"
alias reload_profile="source ~/.bash_profile"
alias edit_vim="vim ~/.vimrc"

## Projects ##
ibsites=/var/www/sites/
fodors=$ibsites/fodors.com/
fodors_wordpress=$ibsites/fodors.com-wordpress/
flyertalk_wordpress=$ibsites/stg1.flyertalk.com/releases/wordpress/flyertalk-wordpress
alias fdr='cd $fodors; clear'
alias fw='cd $fodors_wordpress; clear'
alias fwt='cd $fodors_wordpress/wp-content/themes/fodors; clear'
alias flytw='cd $flyertalk_wordpress; clear'

## Git ##
alias gsb='git status -sb'
alias gfgs='git fetch --all --prune && git status -sb'
alias gcgp='git checkout -- . && git pull'
