#!/bin/bash

_usage() {
    echo "Usage: $(basename "$0") [OPTIONS] [COMMAND] FILE"
    echo "  This script will move/copy a file/directory to temporary space named Stash."
    echo
    echo "Command:"
    echo "  p | pop                        pick file/directory out from Stash."
    echo "  a | popall                     pick all file/directory out within Stash."
    echo "  e | empty                      empty Stash."
    echo
    echo "Options:"
    echo "  -h, --help                     show help."
    echo "  -v, --version                  show script version."
    echo
}

stashDir="${SHELL_STASH_DATA_DIR:-${HOME}/.local/share/shell-stash}"
mkdir -p "${stashDir}"

if [ ${#@} -eq 0 ]; then
    ls -lAGhF "${stashDir}" | sed '1d'
    echo "$(ls -lAG "${stashDir}" | sed '1d' | wc -l) item(s) in Shell Stash."
    exit 0
fi

mvORcp=mv
arg=()

while (( $# > 0 )); do
    case $1 in
        -h )
            _usage
            exit 0
            ;;
        -v )
            echo "ShellStash v1.0.0"
            exit 0
            ;;
        -* )
            if [[ "$1" =~ 'c' ]]; then
                mvORcp=cp
            fi
            shift
            ;;
        * )
            arg+=("$1")
            shift
            ;;
    esac
done

case "${arg[0]}" in
    e | empty )
        rm -rf "${stashDir}" && echo "empty shell stash."
        exit 0
        ;;
    p | pop )
        if [ -z "${arg[1]}" ]; then
            selected=$(find "${stashDir}" -mindepth 1 -maxdepth 1 -exec basename {} \; | fzf --prompt "Shell Stash> ")
            target="${stashDir}/${selected}"
        else
            target="${stashDir}/${arg[1]}"
        fi

        if [ -e "$(basename "${target}")" ]; then
            echo "$(basename "${target}") is already exist."
            exit 1
        fi

        if [ -n "${target}" ]; then
            if [ "${mvORcp}" = 'cp' ]; then
                ${mvORcp} -r "${target}" .
            else
                ${mvORcp} "${target}" .
            fi
            echo "pop: $(basename "${target}")"
        fi
        ;;
    a | all )
        mv "${stashDir}"/* .
        echo "pop all file/directory"
        exit 0
        ;;
    * )
        target="${arg[0]}"
        if [ ! -e "${target}" ]; then
            echo "no file/dir"
            exit 1
        fi

        if [ ! -e "${stashDir}/${target}" ]; then
            if [ "${mvORcp}" = 'cp' ]; then
                ${mvORcp} -r "${target}" "${stashDir}"
            else
                ${mvORcp} "${target}" "${stashDir}"
            fi
            echo "put: ${target}"
        else
            for i in $(seq 99); do
                filename="${target}-$i"
                if [ ! -e "${stashDir}/${filename}" ]; then
                    ${mvORcp} "${target}" "${stashDir}/${filename}"
                    echo "put: ${filename}"
                    break
                fi
            done
        fi
        ;;
esac
