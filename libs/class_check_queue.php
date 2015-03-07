<?php $a = shell_exec('find /var/www/filter_b -regex ".*\(avi\|AVI\|MPG\|mkv\|ogv\|mpg\|divx\|mpeg\|wmv\|ogg\|ogm\|webm\)$" | wc -l  ');
echo 'Queue&nbsp';
echo $a;
echo '';
 ?>

 

 