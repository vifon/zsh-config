# -*- mode: shell-script -*-

if [ "$TTY" = "/dev/tty1" ]; then
    exec startx > /dev/null
fi
