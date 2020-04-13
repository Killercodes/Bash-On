#!/bin/bash

# moves media files to folder
for f in *.mkv *.mp4 *.avi *.wmv; do
        if [ -f "$f" ] # does file exist?
        then
                dir=$(echo "$f" | cut -d'.' -f1) # extract first E## from filename
                if [ "$dir" ] # check if string found
                then
                        mkdir "$dir"  # create dir
                        fanart="${dir}-fanart.jpg" #fanart
                        mv "$fanart" "$dir"
                        poster="${dir}-poster.jpg" # poster
                        mv "$poster" "$dir"
                        nfo="${dir}.nfo" #nfo
                        mv "$nfo" "$dir"
                        srt="${dir}.en.srt" #subtitles
                        mv "$srt" "$dir"

                        mv "$f" "$dir" #movie
                else
                        echo "INCORRECT FILE FORMAT: \""$f"\"" # print error if file format >
                fi
        fi
done
