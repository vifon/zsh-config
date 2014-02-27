# -*- mode: shell-script -*-
# vim: set fdm=marker :
export PATH="$HOME/local/bin:$PATH"
export PATH="/sbin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="$HOME/.bin:$PATH"

export PATH="$HOME/.cabal/bin:$PATH"

export PERL_MB_OPT="--install_base $HOME/.perl5"
export PERL_MM_OPT="INSTALL_BASE=$HOME/.perl5"
export PERL5LIB="$HOME/.perl5/lib/perl5/x86_64-linux-thread-multi:$HOME/.perl5/lib/perl5:$PERL5LIB"
export PATH="$HOME/.perl5/bin:$PATH"

export PYTHONPATH="$HOME/local-my/lib/python:$HOME/local/lib/python2.7/site-packages:$PYTHONPATH"

typeset -U PATH

export C_INCLUDE_PATH="$HOME/local-my/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="$HOME/local-my/include:$CPLUS_INCLUDE_PATH"
export LIBRARY_PATH="$HOME/local-my/lib:$LIBRARY_PATH"
export LD_LIBRARY_PATH="$HOME/local-my/lib:$LD_LIBRARY_PATH"

export ACRONYMDB="$HOME/.resources/acronyms"
export RLWRAP_HOME="$HOME/.rlwrap"

export RANGER_LOAD_DEFAULT_RC=FALSE

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

trap 'exec zsh' USR1
