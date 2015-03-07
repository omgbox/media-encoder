<?php
$a = shell_exec('find /var/www/public -regex ".*\(mp4\)$" | wc -l  ');
echo 'Share&nbsp';
echo  $a;
echo '';
 ?>	
