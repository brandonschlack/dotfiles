# QMK Firmware
export QMK_HOME=$DEV_PROJECTS/Keyboards/qmk_firmware
source ${QMK_HOME}/util/qmk_tab_complete.sh

alias qk='cd $QMK_HOME'
alias reseteeprom='dfu-programmer atmega32u4 erase && dfu-programmer atmega32u4 flash --eeprom $QMK_HOME/quantum/tools/eeprom_reset.hex'
alias qkup='git fetch --all --prune && git stash push -u && git checkout master && git merge upstream/master && git push && git checkout brandonschlack && git merge master --no-edit'

# Flash Massdrop firmware
function mdlflash() {
    local SOURCE="${PWD}"
    local FIRMWARE=""
    if [ $# -gt 1 ]; then
        FIRMWARE=$(echo "${1}_${2}.bin" | sed "s/\//_/")
    else
        FIRMWARE="${1}"
    fi
    cd ${HOME}/.mdloader && ./mdloader_mac --first --download "${SOURCE}/${FIRMWARE}" --restart && cd "${SOURCE}"
}
