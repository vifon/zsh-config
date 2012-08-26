# -*- mode: shell-script -*-

if command -v toilet &> /dev/null; then
    SPLASH="toilet -t -F metal:border -f slant.flf"
fi

if [ -n "$SPLASH" ]; then
    eval $SPLASH <<EOF
Powered by Debian $(uname --operating-system)
EOF
fi
unset SPLASH

start()
{
    exec startx &> /dev/null
}

if [ -n "$SSH_CONNECTION" ]; then
    HISTFILE=~/.zhistory_ssh
    DEF_HISTFILE=~/.zhistory_ssh
    setopt no_hist_accept_space \
              hist_ignore_space
fi
