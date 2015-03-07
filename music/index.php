<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Listen to Music With Html5">
    <meta name="author" content="Audio Directory Player">

    <title>Audio.Trans</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/simple-sidebar.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">

</head>

<body>

    <div id="wrapper">

        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand"><a href="#">Menu</a>
                </li>
                <li><a href="#">Dashboard</a>
            
                </li>
                <li><a href="about.html">About.Trans</a>
                </li>
            </ul>
        </div>

        <!-- Page content -->
        <div id="page-content-wrapper">
            <div class="content-header">
                <h1>
                    <a id="menu-toggle" href="#" class="btn btn-default"><i class="icon-reorder"></i></a>
                    Audio.Trans
                </h1>
            </div>
            <!-- Keep all page content within the page-content inset div! -->
            <div class="page-content inset">


 
         

<?php
if ($handle = opendir('./music')) {
    while (false !== ($entry = readdir($handle))) {
        if ($entry != "." && $entry != "..") {
            echo "


                <div class=\"bs-example\">
      <div class=\"panel panel-default\">
        <div class=\"panel-heading\">$entry</div>
        <div class=\"panel-body\">
          
<br>
<audio controls=\"controls\">  
   <source src=\"music/$entry\" />  
</audio> 
<br>

        </div>
      </div>
   
\n";
        }
    }
    closedir($handle);
}
?>



      
         
                   
                   
                    
                    
                </div>
            </div>
        </div>

    </div>

    <!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>

    <!-- Custom JavaScript for the Menu Toggle -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("active");
    });
    </script>
</body>

</html>
