#!/bin/bash

extension=$1
path=$2
cmd="${@:3}"

execInDir() {
    file=$1

    # get folder
    folder=$(dirname "$file")
    # get local file
    filename=$(basename "$file")
    (
        # switch to it
        cd "$folder"
        # exec cmd with filename behind it
        $cmd $filename
    )
}

# Check if path is file and matches extension
if [[ -f "$path" && "${path##*.}" = "$extension" ]]; then
    execInDir $path
else
    if [[ -f "$path" ]]; then
        # Strip any filename
        path=$(dirname "$path")
    fi

    # Try 3 times
    for i in {0..3}; do
        # Get files with extension
        files=$(find "$path" -iname "*.$extension")
        if [[ "$files" = "" ]]; then
            # If there are none, go up and search again
            path="${path}/.."
        else
            for file in $files; do
                execInDir $file
            done
            break
        fi
    done
fi
