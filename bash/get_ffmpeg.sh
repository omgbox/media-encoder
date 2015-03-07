#!/bin/bash -x

DIR=/var/www/filter_b
find $DIR -type f |
while read i
do
#super fast iphone mp4 
ffmpeg -y -i "$i" -f mp4 -vcodec mpeg4 -b 300k -r 24 -vf scale=320:240 -aspect 16:10 -acodec libvo_aacenc -ar 22050 -ac 2 -ab 48k "$i".mp4 -y 2> /var/www/logs/progress.txt && rm -rf "$i" ;
#flash mp4 i phone android etc
#ffmpeg -y -i "$i" -f mp4 -r 29.97 -vcodec libx264 -preset slow -vf scale=640:480 -b:v 300k -aspect 16:10 -flags +loop -cmp chroma -b:v 300k -maxrate 300k -bufsize 4M -bt 100k -refs 1 -bf 3 -coder 1 -me_method umh -me_range 16 -subq 7 -partitions +parti4x4+parti8x8+partp8x8+partb8x8 -g 250 -keyint_min 25 -level 30 -qmin 10 -qmax 51 -qcomp 0.6 -trellis 2 -sc_threshold 40 -i_qfactor 0.71 -acodec libvo_aacenc -b:a 112k -ar 48000 -ac 2 "$i".mp4 -y 2> /var/www/logs/progress.txt && rm -rf "$i" ;

sleep 2
#move atom shit 
qtfaststart "$i".mp4 "$i".300k.mp4 && rm "$i".mp4

done
