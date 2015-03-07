# media-encoder

﻿SETUP FOR KANDOSAN 3.1
AUTOMATED FFMPEG ENCODER
TESTED ON DEBIAN 7 VPS 512 MB 10GB HD 32BIT, SHOULD RUN ON ALL LINUX SERVERS
DEVELOPED FOR ENCODING LARGE NUMBER OF VIDEO FILES FROM TORRENTS OR LOCAL UPLOADS
THIS SOFTWARE IS FREE FOR PERSONAL USE, YOU MAY NOT USE THIS FOR COMMERCIAL USE.
FEATURES KANDOSAN 3.1
-------------------------------------------------------------------------------|
1. RESPONSIVE LAYOUT |
2. ENCODES WHATEVER FFMPEG CAN OUTPUT |
3. BITTORRENT DOWNLOAD ENCODE STREAM |
4. CODED BY A TRUE NONE PROGRAMMER OVER 1 YEARS LOL |
5. EASY TO ADD CURL, FTP, MEGA.CO.NZ |
6. AUTOPOST TO WORDPRESS --- CURRENTLY REMOVED LOOKING FOR BETTER WAY :-/ |
7. VIDEO GALLERY RESPONSIVE |
--------------------------------------------------------------------------------
Acquirements needed EVERY STEP HAS ITS OWN HOW TO, PLEASE FOLLOW B1,B2, ETC
===========================================================================
1. Install Apache2 + php5 (B1)
2. Install Python qtfaststart (B2)
3. Install Some Headless Torrent Client , Transmission , Deluge ETC (B3)
4. Set-up Crontab -e (B4)
5. Set-up Php.ini limit (B5)
6. Set-up Static FFMPEG 32bit (b6)
===========================================================================
HOW TO INSTALL APACHE2 (b1)- USE Linux Terminal
-------------------------------------------------------------------------
Terminal: apt-get install apache2 -y
Terminal: apt-get install php5 libapache2-mod-php5
Terminal: /etc/init.d/apache2 restart
-------------------------------------------------------------------------
HOW TO INSTALL qtfaststart (b2)- USE Linux Terminal
-------------------------------------------------------------------------
Terminal: wget https://github.com/danielgtaylor/qtfaststart/archive/master.zip
Terminal : unzip master.zip
Terminal: python setup.py install
chmod u+x /usr/bin/qtfaststart
cp /usr/bin/qtfaststart /usr/local/bin/qtfaststart
-------------------------------------------------------------------------
HOW TO INSTALL transmission-daemon (b3)- USE Linux Terminal
-------------------------------------------------------------------------
Terminal: apt-get install transmission-daemon -y
Terminal : /etc/init.d/transmission-daemon stop
Terminal: nano /etc/transmission-daemon/settings.json - CHANGE BELOW
"rpc-username": "your username",
"rpc-password": "your password",
"rpc-whitelist-enabled": true, -- > change true to false
"download-dir": "/var/www/downloads", --- > should look just like this
to save changes CTRL + O Press enter - And CTRL + X to exit nano
access web ui http://192.168.2.11:9091
Upload torrents, Setup upload limit bandwidth ,Downloads etc enable DHT
this section is complete move to (b4)
-------------------------------------------------------------------------
HOW TO INSTALL Crontab -e (b4)- USE Linux Terminal
-------------------------------------------------------------------------
Terminal: crontab -e
paste this at the end of text
# m h dom mon dow command
*/5 * * * * /var/www/bash/grep_ffmpeg.sh
CTRL + X to install this cronjob
to check if its installed
Terminal: crontab -l
make sure you have rights to run crontab, and run it under 1 Account.
-------------------------------------------------------------------------
HOW TO remove limit on php.ini post_max upload_max etc (b5)- USE Linux Terminal
-------------------------------------------------------------------------
Terminal:
nano /etc/php5/apache2/php.ini
nano /etc/php5/cli/php.ini
CTRL + W find Value upload_max_filesize and post_max_size change to higher number like below
upload_max_filesize = 1000M
post_max_size = 1000M
CTRL + O to save
this is only used for the upload system. if limit is not removed, files will not upload.
--------------------------------------------------------------------
HOW TO INSTALL STATIC FFMPEG 32BIT LINUX
------------------------------------------------------------------------
wget http://ffmpeg.gusari.org/static/32bit/ffmpeg.static.32bit.2013-10-20.tar.gz &&
tar -zxvf ffmpeg.static.32bit.2013-10-20.tar.gz &&
chmod u+x ffmpeg && chmod u+x ffprobe &&
cp ffmpeg /usr/bin/ffmpeg &&
cp ffmpeg /usr/local/bin/ffmpeg &&
cp ffprobe /usr/bin/ffprobe &&
cp ffprobe /usr/local/bin/ffprobe
---------------------------------------------------------------------------
now reboot your VPS or Computer.
to test the system out add a video file in /var/www/downloads and wait for little while
check progress on 127.0.0.1 or whatever IP your using. visit share on your IPhone IPad responsive gallery

