mpsyt<<-EOFMarker
        search "$1"
        da 1
EOFMarker

function loop() { 
    for i in "$1"/*
    do
        # if [ -d "$i" ]; then
        #     loop "$i"
        # elif [ -e "$i" ]; then
        #     echo $i
        # else
        #     echo "$i"" - Folder Empty"
        # fi

        j="${i/.webm/}"
        echo j

        ffmpeg -i "$i" -acodec libmp3lame -aq 4 "$j.mp3"
        mv "$j.mp3" "/Users/ramiawar/Desktop/Music"
        rm "$i"

    done
}

loop "/Users/ramiawar/Desktop/Music/tmp"

