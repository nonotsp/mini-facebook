#! /bin/bash

trap 'rm -f mini-facebook.pipe; exit 0;' INT 

mkfifo mini-facebook.pipe
exec 3<> mini-facebook.pipe

while true; do
    read req id arg <&3
    echo "Receive: $req $id $arg"
    case "$req" in
        create)  ./create-v1.sh "$id" >"$id".pipe &;;
        add)     ./add-friend-v1.sh "$id" $arg >"$id".pipe &;;
        post)    ./post-message-v1.sh "$id" $arg >"$id".pipe &;;
        display) ./display-wall-v1.sh "$id" $arg >"$id".pipe &;;
        *)       echo "nok bad request '$req'";;
    esac
done

