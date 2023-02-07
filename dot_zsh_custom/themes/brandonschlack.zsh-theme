local green="%{$fg_bold[green]%}"
local red="%{$fg_bold[red]%}"
local cyan="%{$fg_bold[cyan]%}"
local yellow="%{$fg_bold[yellow]%}"
local blue="%{$fg_bold[blue]%}"
local magenta="%{$fg_bold[magenta]%}"
local white="%{$fg_bold[white]%}"
local reset="%{$reset_color%}"

local ret_status="%(?:$green:$red)"
local privilege_status="%(!.#.$)"

function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "$magenta%n$reset@$cyan%m$reset "
  fi
}

function prompt_char {
    echo -n "$blue"
    if [[ $QMK_HOME && $PWD == $QMK_HOME* ]]; then
        echo -n "%{${PWD//$QMK_HOME/Ψ}%}"
    else
        echo -n "%1~"
    fi
    echo -n "$reset "
}

PROMPT='${ret_status}❯$reset $(ssh_connection)$(prompt_char)$(git_prompt_info)${ret_status}${privilege_status} $reset'

ZSH_THEME_GIT_PROMPT_CLEAN=" $green✔"
ZSH_THEME_GIT_PROMPT_DIRTY=" $yellow✘"
ZSH_THEME_GIT_PROMPT_PREFIX="$cyan("
ZSH_THEME_GIT_PROMPT_SUFFIX="$cyan)$reset "
