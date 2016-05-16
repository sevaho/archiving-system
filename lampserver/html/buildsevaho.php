<?php

 $file_name = $_FILES['file']['name'];
      $file_tmp = $_FILES['file']['tmp_name'];
         move_uploaded_file($file_tmp,"sqluploads/".$file_name);

$dbname = $_POST['dbname'];
putenv("dbname=$dbname");
$output3 = shell_exec('echo "$dbname" > /var/www/html/sqluploads/dbnamefile');
$jaar = $_POST['jaar'] ;
$klas = $_POST['klas'] ;
$naam = $_POST['naam'] ;
$file = $_POST['file'] ;
putenv("jaar=$jaar");
putenv("klas=$klas");
putenv("naam=$naam");
putenv("file=$file");
$output2 = shell_exec('echo "$jaar $klas $naam $file" > /var/www/html/filetobuild/filetobuildfile');

?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sevaho</title>
     <link rel="shortcut icon" href="favicon.png" />
     <link href='https://fonts.googleapis.com/css?family=Roboto:300,400,600,700,900,300italic,400italic,600italic,700italic,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="styles.css" />
    <link rel="stylesheet" href="bootstrap.css" />
      <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
</head>
<body>
<section id="page-welcome" class="page-welcome" >
      <div class="container">
          <div class="row">
<div class = "col-md-12">
<header class="centered">
<br><br><br><br><br><br><br><br><br><br>
<h1 id="intgroot">TOMCAT!</h1>
<h2>Work hard, code harder.</h2>


</header>



<img src="wol.gif" style="width:600px;height:350px;">

</div>
</div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br>

<div class="grad"></div>
<div class="header1">
  <br><br><br>
  <div>S<span>evaho</span></div>
  <p>
Work hard, code harder.
  </p>
</div>

  <div class="login">
<form action = "" method = "POST" enctype = "multipart/form-data">

	<input type="text" placeholder="jaar" name="jaar"><br />
<input type="text" placeholder="klas" name="klas"><br />
<input type="text" placeholder="naam" name="naam"><br />
<input type="text" placeholder="file" name="file"><br />
<input type="text" placeholder="dbname" name="dbname"><br />
	<br><p>sql-file:</p><input type = "file" name = "file" /><br>
<input id="button" type="submit" name="submit" value="submit">
         <ul>
<br><br><br><br>
<!--            <li>Sent file: <?php echo $_FILES['image']['name'];  ?>
           <li>File size: <?php echo $_FILES['image']['size'];  ?>

            <li>File type: <?php echo $_FILES['image']['type'] ?>
//-->
         </ul>


      </form>
    </div>


<div class="container">
<div class="row">
<div class = "col-md-12">

</div>
</div>
</div>
</section>
<footer>
<p>&copy; Sevaho Company</p>
</footer>


<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="js.js"></script>
<script src="prefixfree.min.js"></script>
</body>
</html>
