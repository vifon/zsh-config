# -*- mode: shell-script -*-

case "$TTY" in
    /dev/tty1)
        exec startx > /dev/null
        ;;
    /dev/tty2)
        exec env SESSION=emacs startx > /dev/null
        ;;
esac
