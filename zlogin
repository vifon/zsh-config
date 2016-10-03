# -*- mode: shell-script -*-

start()
{
    exec startx "$@" > /dev/null
}

if [ "$TTY" = "/dev/tty1" ]; then
    exec start
fi
