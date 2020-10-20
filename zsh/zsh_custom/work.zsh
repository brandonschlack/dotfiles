# Internet Brands
#
# Projects
## Local
export WORK_ROOT=$HOME/Documents/Development/Projects/Internet_Brands
fodors=$WORK_ROOT/fodors.com
fodors_wordpress=$WORK_ROOT/fodors.com-wordpress
alias sdf='ssh dev-fodors'

## Remote
function ibdev_remote() {
    local sites="/var/www/sites"
    local server="dev-fodors-web1.internetbrands.com"
    local dir=""
    local command="exec \$SHELL -l"

    while getopts ":s:d:c:" opt; do
        case ${opt} in
            s) server=$OPTARG ;;
            d) dir=$OPTARG ;;
            c) command=$OPTARG ;;
        esac
    done
    shift $((OPTIND -1))

    if [ -n "$dir" ]; then
        case $dir in
            wordpress) dir="${sites}/fodors.com-wordpress" ;;
            wptheme) dir="${sites}/fodors.com-wordpress/wp-content/themes/fodors" ;;
        esac
    else
        dir="${sites}/fodors.com"
    fi

    ssh -t $server "cd $dir; clear; $command;"
}
alias rfw="ibdev_remote -d wordpress"

## Jira Plugin Variables
export JIRA_URL="https://jira.internetbrands.com/"
export JIRA_NAME="bschlack"
export JIRA_DEFAULT_ACTION="dashboard"
