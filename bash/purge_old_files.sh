#!/bin/bash
find /var/www/public -type f -mmin +10080 -exec rm {} \;