#!/bin/bash -x

#giving rights to files
chmod 777 -R /var/www/downloads/* && chmod 777 -R /var/www/upload/server/php/files/* 

sleep 1
#Deleting empty (zero-byte) files
find /var/www/downloads -type f -size 0 -exec rm -f '{}' + && find /var/www/filter_b -type f -size 0 -exec rm -f '{}' +

sleep 1
#Move mp3 and ogg into music folder
find /var/www/downloads -regextype posix-egrep -regex '.*\.(mp3|Mp3|MP3)$' -exec mv "{}" /var/www/music/music/ \;

sleep 1
#Garbage clean up
find /var/www/downloads -regextype posix-egrep -regex '.*\.(vcd|idx|sub|ass|nfo|jpg|JPG|JPEG|gif|png|NFO|log|srt|php|css|js|rar|vob|ts|TS|ppt|gif|doc|wm|wma|MPG|zip|wav|tar|gz|pdf|html|py|pl|exe|htm|exe|pdf|JPG|asf|jpeg|txt|text)$' -exec mv "{}" /var/www/filter_c/ \;

sleep 1
#Move files for processing allowed file types only, from Bit-Torrent Target Folder 
find /var/www/downloads -regextype posix-egrep -regex '.*\.(avi|m2ts|flv|M2TS|3gp|AVI|MPG|mkv|MKV|ogv|wmv|WMV|mp4|mpg|divx|MPG|mpeg|ogg|ogm)$' -exec mv "{}" /var/www/filter_a/ \;

sleep 1
#Move files for processing from user uploads
find /var/www/upload/server/php/files -regextype posix-egrep -regex '.*\.(avi|m2ts|flv|M2TS|3gp|AVI|MPG|mkv|MKV|ogv|wmv|WMV|mp4|mpg|divx|MPG|mpeg|ogg|ogm)$' -exec mv "{}" /var/www/downloads/ \;

sleep 1

#Garbage clean up from user uploads
find /var/www/upload/server/php/files -regextype posix-egrep -regex '.*\.(vcd|idx|sub|ass|nfo|jpg|JPG|JPEG|gif|png|NFO|log|srt|php|css|js|rar|vob|ts|TS|ppt|gif|doc|wm|wma|MPG|zip|wav|tar|gz|pdf|html|py|pl|exe|htm|exe|pdf|JPG|asf|jpeg|txt|text)$' -exec mv "{}" /var/www/filter_c/ \;

sleep 1
#correct file names stage 1
cd /var/www/filter_a
for f in *; do mv -- "$f" "${f//[][(){\}]}"; done

sleep 1 
#correct file names stage 2 final 
cd /var/www/filter_a
for infile in *.*;
do 
#replace " - " with a single underscore.
NEWFILE1=`echo $infile | sed 's/\s-\s/_/g'`; 
#replace spaces with underscores
NEWFILE2=`echo $NEWFILE1 | sed 's/\s/_/g'`; 
#replace "-" dashes with underscores.
NEWFILE3=`echo $NEWFILE2 | sed 's/-/_/g'`; 
#remove exclamation points
NEWFILE4=`echo $NEWFILE3 | sed 's/!//g'`; 
#remove commas
NEWFILE5=`echo $NEWFILE4 | sed 's/,//g'`; 
mv "$infile" "/var/www/filter_b/$NEWFILE5";
done;

sleep 1
#give access to files in this directory
chmod 777 -R /var/www/filter_b/*

sleep 1
#start FFMPEG processing 
/var/www/bash/get_ffmpeg.sh

sleep 1
#grab video thumbnail
/var/www/bash/get_thumbs.sh

sleep 1
# move processed video and thumbnail to public folder 
find /var/www/filter_b -regextype posix-egrep -regex '.*\.(jpg|mp4)$' -exec mv "{}" /var/www/public/ \;

#sleep 1
 
#find /var/www/filter_b -regextype posix-egrep -regex '.*\.(txt)$' -exec mv "{}" /var/www/public/ \;

sleep 1
#removing FFMPEG log file for next job
rm -f  `find /var/www/logs/* | grep -v .text`

sleep 1
#Garbage clean up whatever is left 
rm -rf /var/www/filter_c/*

sleep 1
#Purge old files 48 hours old
/var/www/bash/purge_old_files.sh

sleep 1
#remove empty folders
find /var/www/downloads/* -empty -type d -delete

sleep 1
#delete files which have SAMPLE.avi sample.avi which come with some  torrent files 
/var/www/bash/sample_delete.sh

#sleep 5
#delete files which are less than 2mb in size. this is off currently ! 
#find /var/www/public -name "*.mp4" -size "-$((2*1024*1024))c" -exec rm -f {} +
 
