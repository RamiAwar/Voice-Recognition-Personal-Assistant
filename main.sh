
#!/bin/bash

while true
do


python3 STT.py

TEXT=$(<data.txt)
rm data.txt

echo $TEXT

FIRSTWORD=$(echo $TEXT | awk '{print $1}')
echo "Firstword:::$FIRSTWORD"

case "$FIRSTWORD" in
   ("play")
      echo "Playing ${TEXT:5}"
      ./youtube.sh "${TEXT:5}"
      ;;
   
   ("sleep")
      echo "Sleeping..."
      break
      ;;
   ("error")
      echo "Error... Listening"
      continue
      ;;
   ("download")
      echo "Downloading ${TEXT:9}"
      ./download.sh "${TEXT:9}"
      ;;
   (*) 
   	echo "Interpreting..."
      python3 queryprocess.py $TEXT
      ;;
esac


RESULT=$(<result.txt)
rm result.txt

./TTS.sh "$RESULT"

done