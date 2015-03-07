
<?php
$check_memory = shell_exec('top -n 1 -b | grep "Mem"');
echo "<h5>$check_memory</h5>" ;
?>
