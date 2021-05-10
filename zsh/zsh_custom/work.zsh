# Internet Brands
#
# Projects
## Local
secrets source internet_brands

alias sdf='ssh dev-fodors'

function jenkins-build() {
    local site="$1"
    local branch="$2"
    local environment="$3"

    if [ -n "$site" ]; then
        case $site in
            main) site=$FODORS_MAIN_JENKINS_JOB ;;
            wordpress) site=$FODORS_WORDPRESS_JENKINS_JOB ;;
        esac
    else
        site=$FODORS_MAIN_JENKINS_JOB
    fi

    jenkins build "${site}" -p branch_name="${branch}" -p staging_to_build="${environment}" -f -v
}
