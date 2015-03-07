#!/bin/sh -x


SERVICE='ffmpeg'
 
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, do not bother ffmpeg yet"
else
 
    echo "$SERVICE is not running!" | /var/www/bash/kservice.sh
fi