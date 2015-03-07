<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GALLERY</title>
    <meta name="description" content="Responsive kandosan">
    <meta name="author" content="GALLERY">

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le styles -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/base.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
</head>

  <body>

        <div class="container">
            <div id="page-header" class="navbar page-header">

	    <ul class="breadcrumb">
    <li><a href="../index.html">Home</a> <span class="divider">/ <a href="../upload">upload</a></span></li>
  
     </ul>

                    <div class="brand">
                        <div>
                            <h1><a href="#" class="home" >Shared Files</a></h1>
                            <small><span class="badge badge-inverse"><?php
 $a = shell_exec('find /var/www/public -regex ".*\(mp4\)$" | wc -l  ');
echo '';
echo $a;
echo '';
 ?>	
</small>
                        </div>
                    </div>
                <div id="navbar" class="container visible-desktop">
                    <div class="nav-collapse">
                        <ul id="nav" class="nav">
                          <li><a href="#">Home</a></li>
                          
                        </ul>
                    </div>
                </div>

                
            </div>

            
                    

<?php include ("domains.php"); $get_domain = GetRootDomain();?>
<?php
$count = 0;
if ($handle = opendir('../public')) {
while (false !== ($file = readdir($handle))) {
    if ($file != "." && $file != ".." 
    
    && substr($file,-strlen(".html")) != ".html"  
 
	&& substr($file,-strlen(".sh")) != ".sh"  
	&& substr($file,-strlen(".srt")) != ".srt"  
	&& substr($file,-strlen(".sub")) != ".sub"  
	&& substr($file,-strlen("subs")) != "subs"  
 	&& substr($file,-strlen("png")) != "png"  
 	&& substr($file,-strlen("jpg")) != "jpg" 
 	&& substr($file,-strlen("ass")) != "ass" 
 	&& substr($file,-strlen("txt")) != "txt"  
 	&& substr($file,-strlen("js")) != "js"  
   
    ) {$count++;
        print("


  <div id=\"content\">
                <div class=\"box\">


<img alt=\"Agra picture\" src=\"../public/$file.thumb.jpg\">
<p><pre>$file</pre></p>
                    <p><a class=\"btn btn-primary\" href=\"http://$get_domain/public/$file\">download</a> </p>

 
 </div>
 
    



\n");

    }

}

closedir($handle);
}
?>
 
   
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/libs/jquery.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/libs/jquery.masonry.min.js"></script>
    <script src="js/base.js" type="text/javascript"></script>


</body>



</html>
