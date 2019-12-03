#!/bin/sh
while true; do
    cd $SHARED_DIR/app
    git pull
    echo "New run."
    sleep 10
done
