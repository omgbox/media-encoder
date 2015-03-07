<?php
function GetRootDomain()
{
    $URL = strtolower($_SERVER["HTTP_HOST"]);

    $URL = preg_replace('/^www./','',$URL);

    $URL = parse_url($URL);

    if (!empty($URL["host"])) {
        return $URL["host"];
    } else {
        return $URL["path"];
    }
}
?>