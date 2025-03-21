#!/bin/bash

id="$1"

if [ -z "$id" ]; then
    echo "nok please provide an identifier"
    exit 1
fi

./P.sh "$id.lock"

if [ -e "$id" ]; then
    echo "nok user '$id' already exists"
else
    mkdir -p "$id"
    touch "$id/wall" "$id/friends"
    echo "ok"
fi

./V.sh "$id.lock"
