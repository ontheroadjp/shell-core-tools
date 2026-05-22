#!/bin/bash

_create_backup_file() {
    [ $# -ne 1 ] && echo 'no file/dir' && exit 1
    [ ! -e "$(basename "$1")" ] && echo 'no file/dir' && exit 1
    local bk_name="bk_$(date '+%Y%m%d')_$(basename "$1").tar.gz"
    tar czf "${bk_name}" "$1"
    echo "backed up. ($1 >>> ${bk_name})"
}

_create_backup_file_and_remove_original() {
    _create_backup_file "$@" && rm -rf "$@"
}

_restore_backup_file() {
    [ $# -ne 1 ] && echo 'no file/dir' && exit 1
    local strip
    strip=$(echo "$1" | sed -e 's/\.tar\.gz$//g')
    [ ! -e "$1" ] && [ ! -e "${strip}.tar.gz" ] && echo 'no file/dir' && exit 1
    tar xzf "${strip}.tar.gz"
    echo "Restored. ($1)"
}

_restore_backup_file_and_remove_original() {
    _restore_backup_file "$@" && rm -rf "$@"
}

case "$1" in
    bk)    shift; _create_backup_file "$@" ;;
    bkrm)  shift; _create_backup_file_and_remove_original "$@" ;;
    kb)    shift; _restore_backup_file "$@" ;;
    kbrm)  shift; _restore_backup_file_and_remove_original "$@" ;;
    *)
        echo "Usage: $(basename "$0") <command> <file>"
        echo "Commands:"
        echo "  bk    <file>   backup (tar.gz)"
        echo "  bkrm  <file>   backup then remove original"
        echo "  kb    <file>   restore from backup"
        echo "  kbrm  <file>   restore then remove backup"
        exit 1
        ;;
esac
