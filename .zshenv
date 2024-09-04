export LANG=en_US.UTF-8
export YELLOW=`echo -e '\033[1;33m'`
export LIGHT_CYAN=`echo -e '\033[1;36m'`
export GREEN=`echo -e '\033[0;32m'`
export NOCOLOR=`echo -e '\033[0m'`
export LESS="-iMSx4 -FXR"
export PAGER="sed \"s/^\(([0-9]\+ [rows]\+)\)/$GREEN\1$NOCOLOR/;s/^\(-\[\ RECORD\ [0-9]\+\ \][-+]\+\)/$GREEN\1$NOCOLOR/;s/|/$GREEN|$NOCOLOR/g;s/^\([-+]\+\)/$GREEN\1$NOCOLOR/\" 2>/dev/null | less"

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

alias set_git_private_profile="git config user.name 'Kaoru' && git config user.email 'kaoru@steinboeck.dev' && git config core.sshCommand 'ssh -i ~/.ssh/id_rsa_kaoru'"
alias tmux="tmux -2 -f ~/.tmux.conf"

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history

# Allow piping to a buffer
function e () {
    local EMACSOPT=""

    FILES=()
    while [[ $# -gt 0 ]]; do
        key="$1"
        case $key in
            -*) EMACSOPT+="$key "; shift;;
            *) FILES+=("$key"); shift;;
        esac
    done

    # No options given, make our best guess
    if [[ ! "${EMACSOPT}" ]]; then
        if [[ "$INSIDE_EMACS" ]]; then
            EMACSOPT=""
        elif [[ "$DISPLAY" ]]; then
            EMACSOPT="-c "
        else
            EMACSOPT="-nw "
        fi
    fi

    if [ -p /dev/stdin ]; then
        # Input is a pipe, set up temp file
        TMP="$(mktemp)"
        cat > $TMP
        FILES+=("$TMP")
    elif [[ -z "$FILES" && -p /dev/stdout ]]; then
        TMP="$(mktemp)" # piping out needs a temp file
        FILES+=("$TMP")
    fi

    for FILE in "${FILES[@]}"; do
        FILE=$(readlink -m "${FILE}") # Absolute file path
        if [[ -p /dev/stdout || "$EMACSOPT" || "$TMP" ]];then
            emacsclient -q ${EMACSOPT} "$FILE" ;
        else
            if [[ $SSH_CONNECTION ]]; then
                emacsclient -q -e "(find-file-other-window \"/ssh:${ssh_hostname}:$FILE\")";
            else
                emacsclient -q -e "(find-file-other-window \"$FILE\")";
            fi
        fi

        if [ -p /dev/stdout ]; then
            # Output is a pipe
            cat $FILE
        fi
    done

    if [ ! -z "$TMP" ]; then
        # Cleanup tmp files
        rm $TMP
    fi
}
alias e="emacsclient -n"

export KUBE_EDITOR=e

function tempbuffer() {
  perl -MFile::Temp -MFile::Copy -e \
  'copy *STDIN, $file = File::Temp->new; system "emacsclient", $file';
}


for file in ~/.zshenv_*; do
    source "$file"
done

bat() {
    BAT_PAGER='less-rs /dev/stdin' command bat --terminal-width="$(($COLUMNS - 4))" "$@"
    return $?
}
