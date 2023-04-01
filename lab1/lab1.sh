#!bin/bash

SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}

#echo "${SOURCE_DIR}"
#echo "${RM_LIST}"
#echo "${TARGET_DIR}"

#creating files and directories for testing

#touch ./lab_uno/testfile
#mkdir ./lab_uno/testdir
#mkdir ./lab_uno/testdir2
#mkdir ./lab_uno/testdir3
#mkdir ./lab_uno/testdir4
#mkdir ./lab_uno/testdir5
#touch ./lab_uno/testdir/fileindirectory

# checking if directory TARGET_DIR exists

if [[ ! -d ${TARGET_DIR} ]]; then
    echo "Creating new directory: ${TARGET_DIR}"
    mkdir ${TARGET_DIR}
else   
    echo "${TARGET_DIR} directory already exists"
fi

# reading from RM_LIST

RM_LIST_CONTENT=$(cat ${RM_LIST})
#echo "${RM_LIST_CONTENT}"

# iterating through RM_LIST contents

for NAME in ${RM_LIST_CONTENT}; do

    if [[ -e ${SOURCE_DIR}/${NAME} ]]; then
        rm -rf ${SOURCE_DIR}/${NAME}
        echo "DELETED: ${NAME} from directory: ${SOURCE_DIR}" 
    else
        echo "${NAME} does not exist in directory: ${SOURCE_DIR}"
    fi

done

# moving to TARGET_DIR

for FILE in ${SOURCE_DIR}/*; do

    if [[ -f ${FILE} ]]; then
        mv ${FILE} ${TARGET_DIR}
        echo "File: ${FILE} moved to ${TARGET_DIR}"
    elif [[ -d ${FILE} ]]; then
        cp -r ${FILE} ${TARGET_DIR}
        echo "Directory: ${FILE} moved to ${TARGET_DIR} with it's contents"
    fi

done

# counting remaining things in SOURCE_DIR

FILE_COUNTER=$(ls ${SOURCE_DIR} | wc -l)
#echo "${FILE_COUNTER}"

# printing amount of things in SOURCE_DIR

if [[ ${FILE_COUNTER} -gt 0 ]]; then
    echo "Jeszcze coś zostało"
    if [[ ${FILE_COUNTER} -gt 4 ]]; then
        echo "Zostało więcej niż 4 pliki"
    elif [[ ${FILE_COUNTER} -gt 2 ]]; then
        echo "Zostało od 2 do 4 plików"
    else
        echo "Zostały 2 lub mniej plików"
    fi
else
    echo "Tu był KONONOWICZ"
fi

# creating zip TARGET_DIR

zip -r "${TARGET_DIR}_$(date +%F).zip" ${TARGET_DIR}
