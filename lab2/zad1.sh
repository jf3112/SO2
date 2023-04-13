#!/usr/bin/bash -e

DIR_1=${1}
DIR_2=${2}

#checking if 2 directiories were given

if [[ $# -ne 2 ]]; then

    echo "2 Directories were not given"
    exit 1

fi

#checking if given directories exist    

if [[ ! -d "${DIR_1}" ]]; then

    echo "Directory ${DIR_1} does not exist"
    exit 1

fi

if [[ ! -d "${DIR_2}" ]]; then

    echo "Directory ${DIR_2} does not exist"
    exit 1

fi

set -u

DIR_1=$(cd "${DIR_1}" && pwd)

for FILE in ${DIR_1}/*; do

    FILENAME=${FILE##*/}

    if [[ -f ${FILE} ]]; then

        echo "${FILENAME} is a file"
        ln -s ${DIR_1}/${FILENAME} ${DIR_2}/${FILENAME^^}

        Y=${FILENAME}
        Y+="_ln"
        
        echo "${Y}"

    elif [[ -d ${FILE} ]]; then

        echo "${FILENAME} is a directory"
        ln -s ${DIR_1}/${FILENAME} ${DIR_2}/${FILENAME^^}

    elif [[ -L ${FILE} ]]; then

        echo "${FILENAME} is a link"

    fi

done



