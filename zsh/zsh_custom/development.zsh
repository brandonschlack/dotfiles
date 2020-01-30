# Development Variables
export PATH=$PATH:$QMK_HOME/bin

# Development Functions
# gitignore.io command
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
#
# Update Tower environment plist
function towerpath() {
    local plistpath="${HOME}/Library/Application Support/com.fournova.Tower3/environment.plist"
    local current=$(plutil -extract PATH xml1 -o - "${plistpath}" | sed -n "s/.*<string>\(.*\)<\/string>.*/\1/p")
    case "$1"
    in
        update)
            if [ "${val}" = "${PATH}" ]; then
                echo "Already up-to-date!"
            else
                echo "updating with current path..."
                plutil -replace PATH -string "${val}" "${plistpath}";
            fi
            ;;
        current)            
            echo $current
            ;;

    esac
}
