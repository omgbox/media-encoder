#!/bin/bash -x
for file in /var/www/filter_b/*; do `mediainfo $file >$file.txt`; done 
