local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

function prompt_char {
    if [[ $PWD == $QMK_HOME* ]]; then
        echo -n "%{${PWD//$QMK_HOME/Ψ}%}"
    else
        echo -n "%1~"
    fi
}

PROMPT='%{$fg_bold[green]%}❯ %{$fg_bold[blue]%}$(prompt_char) $(git_prompt_info)% %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_CLEAN=") %{$fg_bold[green]%}✔ "
ZSH_THEME_GIT_PROMPT_DIRTY=") %{$fg_bold[yellow]%}✘ "
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
