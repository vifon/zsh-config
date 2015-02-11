# -*- mode: shell-script -*-
# vim: set fdm=marker :
export PATH="/sbin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="$HOME/.bin:$PATH"

export PATH="$HOME/.cask/bin:$PATH"

export PATH="$HOME/.cabal/bin:$PATH"

export PERL_MB_OPT="--install_base $HOME/.perl5"
export PERL_MM_OPT="INSTALL_BASE=$HOME/.perl5"
typeset -T PERL5LIB perl5lib
export PERL5LIB="$HOME/.perl5/lib/perl5/x86_64-linux-thread-multi:$HOME/.perl5/lib/perl5:$PERL5LIB"
export PATH="$HOME/.perl5/bin:$PATH"

typeset -T PYTHONPATH pythonpath
export PYTHONPATH="$HOME/.local/lib/python3:$HOME/.local/lib/python3/site-packages:$PYTHONPATH"

export PATH="$HOME/.gem/ruby/2.1.0/bin:$PATH"

typeset -T C_INCLUDE_PATH c_include_path
typeset -T CPLUS_INCLUDE_PATH cplus_include_path
typeset -T LIBRARY_PATH library_path
typeset -T LD_LIBRARY_PATH ld_library_path

# ~/local package paths
export PATH="$HOME/local/bin:$PATH"
export C_INCLUDE_PATH="$HOME/local/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="$HOME/local/include:$CPLUS_INCLUDE_PATH"
export LIBRARY_PATH="$HOME/local/lib:$LIBRARY_PATH"
export LD_LIBRARY_PATH="$HOME/local/lib:$LD_LIBRARY_PATH"
export PYTHONPATH="$HOME/local/lib/python3.4/site-packages:$HOME/local/lib/python2.7/site-packages:$PYTHONPATH"

# ~/local-my custom paths
export C_INCLUDE_PATH="$HOME/local-my/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="$HOME/local-my/include:$CPLUS_INCLUDE_PATH"
export LIBRARY_PATH="$HOME/local-my/lib:$LIBRARY_PATH"
export LD_LIBRARY_PATH="$HOME/local-my/lib:$LD_LIBRARY_PATH"
export PYTHONPATH="$HOME/local-my/lib/python:$PYTHONPATH"

FPATH=$HOME/.fpath:$FPATH

typeset -U PATH PYTHONPATH PERL5LIB C_INCLUDE_PATH CPLUS_INCLUDE_PATH LIBRARY_PATH LD_LIBRARY_PATH FPATH

export ACRONYMDB="$HOME/.resources/acronyms"
export RLWRAP_HOME="$HOME/.rlwrap"

if [ -d ~/.config/ranger ]; then
    export RANGER_LOAD_DEFAULT_RC=FALSE
fi
