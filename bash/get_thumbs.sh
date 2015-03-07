#!/bin/bash -x
for file in /var/www/filter_b/*; do `ffmpeg -i $file -an -ss 00:00:15 -an -r 1 -s 300x225 -vframes 1 -y $file.thumb.jpg `;
done

 
 

 

