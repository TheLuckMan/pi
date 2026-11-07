#!/usr/bin/env sh

type=install
if [ "$1" = '--remove-pi' ]; then
    type=remove
fi
echo "Pi: setup"
echo "Type of $type: (U)ser-only, (S)ystem-wide, System-(W)ide - for BSD"
read a
if [ "a" = 'U' -o "a" = 'u' ]; then
    if [ "$type" = 'remove' ]; then
      rm -rf $HOME/.config/pi
      rm $HOME/.local/bin/pi
    fi
    install -Dm 644 examples/user.conf $HOME/.config/pi/pi.conf
    install -Dm 755 ./pi $HOME/.local/bin/
    if [ ! "$(echo $PATH | grep .local/bin) " ]; then
        echo "Warning: please, add $HOME/.local/bin to the \$PATH variable!"
    fi
elif [ a = 'S' -o "a" = 's' ]; then
        if [ "$EUID" -ne 0 ]; then
        echo "Error: setup: It require root to continue"
        exit
    else
        if [ "$type" = 'remove' ]; then
            rm -rf /etc/pi
            rm /sbin/pi
        else
            install -Dm 644 examples/system.conf /etc/pi/pi.conf
            install -Dm 755 ./pi /sbin/
            fi
        fi
elif [ a = "W" -o "w" ]; then
    if [ "$EUID" -ne 0 -a "$USERONLY" != 'true' ]; then
        echo "Error: setup: It require root to continue"
        exit
   else
       if [ "$type" = 'remove' ]; then
           rm -rf /usr/local/etc/pi
           rm /usr/local/sbin/pi
       else
        install -Dm 644 examples/bsd.conf /usr/local/etc/pi/pi.conf
        install -Dm 755 ./pi /usr/local/sbin/
       fi
    fi
fi
