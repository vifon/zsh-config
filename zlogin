# -*- mode: shell-script -*-

start()
{
    exec startx "$@" &> /dev/null
}

if [ "$TTY" = "/dev/tty1" ]; then
    exec start
fi

if [ -n "$SSH_CONNECTION" ]; then
    HISTFILE=~/.zhistory_ssh
    DEF_HISTFILE=~/.zhistory_ssh
fi
