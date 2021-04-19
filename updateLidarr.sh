#!/bin/bash

# bash updateLidarr.sh "Artist Name"

# Settings
lidarrApi=`cat $HOME/.config/tokens/lidarr.api`
lidarrUrl="http://localhost"
lidarrPort="3086"
musicDir="/home/media/music/stark/"

artistLoc="$musicDir$1/"

# # Look up the last updated artist
# artistLoc="$musicDir"`beet ls -af %asciify{'$albumartist'} 'added:-1d..' added- | head -n 1`"/"



if [[ -d "$artistLoc" ]]
then
    # Call Lidarr API
    curl -Ls "$lidarrUrl":"$lidarrPort"/api/v1/command -d "{\"name\": \"RescanFolders\", \"folders\": [\"${artistLoc}\"]}" --header "X-Api-Key:$lidarrApi"
else
    echo "Nope"
fi
