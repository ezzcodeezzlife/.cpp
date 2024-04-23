#!/bin/bash
FILE=hello.cpp
OUTPUT=hello
g++ $FILE -o $OUTPUT
while inotifywait -e close_write $FILE
do
    g++ $FILE -o $OUTPUT
    if [ $? -eq 0 ]
    then
        echo "----- Running program -----"
        ./$OUTPUT
    fi
done