#! /bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 identifier"
    exit 1
fi

trap 'rm -f "$1.pipe"; exit 0;' INT

mkfifo "$1.pipe"
exec 3<> "$1.pipe"

while true; do
    echo -n "Please, enter a command: "
    read req args

    if [ -n "$req" ]; then
        echo "$req" "$1" "$args" >mini-facebook.pipe

        read ok msg <&3

        if [ "$ok" = "start-of-file" ]; then
            while [ "$ok" != "end-of-file" ]; do
                read ok <&3
                if [ "$ok" != "end-of-file" ]; then
                    echo $ok
                fi
            done
        elif [ "$ok" = "ok" ]; then
            echo "Command successfuly executed"
        else
            echo "Error $ok: $msg"
        fi
    fi
done
