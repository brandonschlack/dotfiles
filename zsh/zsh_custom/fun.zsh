# Randon Seinfeld
function seinfeld() {
    local SRC=$(curl -s 'https://www.episodegenerator.com/seinfeld')
    local SEASON=$(echo $SRC | grep -Eo '(?:itemprop="season">)(\d+)' | cut -c19-);
    local EPISODE=$(echo $SRC | grep -Eo '(?:itemprop="episode">)(\d+)' | cut -c20-);
    local TITLE=$(echo $SRC | grep -Eo '(?:"episodetitle">)([A-Za-z0-9_[:space:]]+)' | cut -c16-);
    echo "Season $SEASON, Episode $EPISODE: $TITLE";
}

# Quick Set Film Date
function filmdate() {
    local DATESTART="${1}"
    local FILMROLL="${2}"

    exiftool -q -overwrite_original -alldates="${DATESTART}" "${FILMROLL}"
    exiftool -overwrite_original -fileOrder '${filename}' '-alldates+<0:${filesequence}' "${FILMROLL}"

    shopt -s nullglob
    for image in $FILMROLL/*.jpg; do
        exiftool -FileName -DateTimeOriginal "$image"
    done
    shopt -u nullglob
}
