#----------------------------------------------------------------
# dirmarks
#----------------------------------------------------------------
function _dirmarks() {
    [ -z $DIRMARKS_DATA_DIR ] && {
        dirmarks="${HOME}/.local/share/dirmarks"
    } || dirmarks=${DIRMARKS_DATA_DIR}
    mkdir -p ${dirmarks}

    case $1 in
        mark )
            pwd > ${dirmarks}/${2}${2}
            echo 'markd!'
            return 0
            ;;
        jump )
            [ -f ${dirmarks}/${2}${2} ] && {
                # cat ${dirmarks}/${2}${2}
                cd $(cat ${dirmarks}/${2}${2})
            } || echo "not set."
            return 0
            ;;
    esac
}

function _cd_to_dirmarks() {
    result=$(cat $(find ${DIRMARKS_DATA_DIR:-${HOME}/.local/share/dirmarks} -type f) | fzf)
    [ ! -z ${result} ] && { cd ${result} }
}

alias mm='_dirmarks mark m'
alias nn='_dirmarks mark n'
alias jj='_dirmarks mark j'
alias kk='_dirmarks mark k'
alias ll='_dirmarks mark l'
alias oo='_dirmarks mark o'
alias ii='_dirmarks mark i'
alias uu='_dirmarks mark u'

alias m='_dirmarks jump m'
alias n='_dirmarks jump n'
alias j='_dirmarks jump j'
alias k='_dirmarks jump k'
alias l='_dirmarks jump l'
alias i='_dirmarks jump i'
alias o='_dirmarks jump o'
alias u='_dirmarks jump u'

alias marks='_cd_to_dirmarks'
