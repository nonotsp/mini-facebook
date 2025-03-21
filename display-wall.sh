#!/bin/bash

id="$1"

echo "start-of-file"

./P.sh "$id.lock"

if [ ! -f "$id/friends" ]; then
    echo "nok '$id' does not exist"
else
    cat "$id/wall"
fi

echo "end-of-file"

./V.sh "$id.lock"
