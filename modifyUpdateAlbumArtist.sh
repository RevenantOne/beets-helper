#!/bin/bash

# bash modifyUpdateAlbumArtist.sh "Artist Name"

echo "Modifying album artist to $1"
yes | beet mod -a albumartist:"$1" albumartist="$1" &
wait $!
echo "Updating files to reflect $1"
beet up -a albumartist:"$1" &
wait $!