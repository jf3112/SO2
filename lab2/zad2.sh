#!/usr/bin/bash -e

DIR_1=${1}

if [[ $# -ne 1 ]]; then

    echo "2 Directories were not given"
    exit 1

fi

#checking if given directories exist    

if [[ ! -d "${DIR_1}" ]]; then

    echo "Directory ${DIR_1} does not exist"
    exit 1

fi

set -u

#files with .bak extension no editing
find ${DIR_1} -type d -name "*.bak" -exec chmod u-r "$PWD/{}" \;

#directories with .bak extension entering for only group and others
find ${DIR_1} -type f -name "*.bak" -exec chmod a-x "$PWD/{}" \;
find ${DIR_1} -type f -name "*.bak" -exec chmod g+x "$PWD/{}" \;
find ${DIR_1} -type f -name "*.bak" -exec chmod o+x "$PWD/{}" \;

#directories with .tmp extension all permisions for everyone
find ${DIR_1} -type d -name "*.tmp" -exec chmod a+rwx "$PWD/{}" \;

#files with .txt extension w for owners, r for group and x for others
find ${DIR_1} -type f -name "*.txt" -exec chmod a-rwx "$PWD/{}" \;
find ${DIR_1} -type f -name "*.txt" -exec chmod u+w "$PWD/{}" \;
find ${DIR_1} -type f -name "*.txt" -exec chmod g+r "$PWD/{}" \;
find ${DIR_1} -type f -name "*.txt" -exec chmod o+x "$PWD/{}" \;