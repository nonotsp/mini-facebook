#!/bin/bash

id="$1"
friend="$2"

./P.sh "$id.lock"

if [ ! -f "$id/friends" ]; then
    echo "nok '$id' does not exist"
elif [ ! -f "$friend/friends" ]; then
    echo "nok '$friend' does not exist"
elif grep -qx "$friend" "$id/friends"; then
    echo "nok '$friend' is already a friend of '$id'"
else
    echo "$friend" >> "$id/friends"
    echo "ok"
fi
