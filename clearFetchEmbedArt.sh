#!/bin/bash

# bash clearFetchEmbedArt.sh "Artist Name"
# or
# bash clearFetchEmbedArt.sh "Artist Name" "Album Name" "Album Name 2" etc

if [[ -z ${1} ]]
then
    echo "Error: No artist provided!"
    exit
fi

if [[ -z ${2} ]]
then
    echo "Clearing art for $1..."
    beet clearart -y albumartist:"$1" &
    wait $!
    echo ""
    echo "Fetching art for $1..."
    beet fetchart -f albumartist:"$1" &
    wait $!
    echo "Embeding art for $1..."
    beet embedart -y albumartist:"$1" &
    wait $!
    echo ""
    echo "Art updated for $1!"
else
    i=0
    for arg in "$@"
    do 
        if (( $i > 0 ))
        then
            echo "Clearing art for $1 - $arg..."
            beet clearart -y albumartist:"$1" album:"$arg" &
            wait $!
            echo ""
            echo "Fetching art for $1 - $arg..."
            beet fetchart -f albumartist:"$1" album:"$arg" &
            wait $!
            echo "Embeding art for $1 - $arg..."
            beet embedart -y albumartist:"$1" album:"$arg" &
            wait $!
            echo ""
            echo "Art updated for $1 - $arg!"
        fi
        i=$((i+1))
    done
fi