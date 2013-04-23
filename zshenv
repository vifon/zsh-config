# -*- mode: shell-script -*-
# vim: set fdm=marker :
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/local/bin:$PATH"
export PATH="/sbin:$PATH"
export PATH="/usr/sbin:$PATH"

export PATH="$HOME/.cabal/bin:$PATH"

export C_INCLUDE_PATH="$HOME/local-my/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="$HOME/local-my/include:$CPLUS_INCLUDE_PATH"
export LIBRARY_PATH="$HOME/local-my/lib:$LIBRARY_PATH"
export LD_LIBRARY_PATH="$HOME/local-my/lib:$LD_LIBRARY_PATH"

export ACRONYMDB="$HOME/.resources/acronyms"

ssh_connection_to_urxvt() {
        # don't propagate information to urxvt if ssh is used non-interactive
    [ -t 0 ] || [ -t 1 ] || return

    local update="\0033]777;cwd-spawn;ssh;$1\0007"

    case $TERM in
        screen*)
        # pass through to parent terminal emulator
            update="\0033P$update\0033\\";;
    esac

    echo -ne "$update"
}
