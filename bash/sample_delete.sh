#!/bin/bash
cd /var/www/filter_b
find |grep 'sample'|xargs rm -f

sleep 2

cd /var/www/filter_b
find |grep 'Sample'|xargs rm -f
