#!/bin/bash -x
find /var/www/downloads -name '*.wmv' -exec bash -c 'ffmpeg -i "$0" -vcodec libvpx -acodec libvorbis -cpu-used 5 -threads 8 "${0%%.mp4}.webm"' {} \;