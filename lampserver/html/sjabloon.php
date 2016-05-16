<?php
   if(isset($_FILES['image'])){
      $errors= array();
      $file_name = $_FILES['image']['name'];
      $file_size = $_FILES['image']['size'];
      $file_tmp = $_FILES['image']['tmp_name'];
      $file_type = $_FILES['image']['type'];
      $file_ext=strtolower(end(explode('.',$_FILES['image']['name'])));

if($file_size > 2097152) {
         $errors[]='File size must be excately 2 MB';
      }
      
           
if(empty($errors)==true) {
         move_uploaded_file($file_tmp,"uploads/".$file_name);

         echo "Success";
$output2 = shell_exec('sudo -u vagrant /var/www/html/uploadfiles.sh "phptesting" "z" "z"');

echo " ";
echo shell_exec('whoami');

echo "<pre>$output</pre>";
$output2 = shell_exec('sh ./test.sh');

      }else{
         print_r($errors);
      }
   }

?>

<html>
   <body>
      
      <form action = "" method = "POST" enctype = "multipart/form-data">
         <input type = "file" name = "image" />
         <input type = "submit"/>
			
         <ul>
            <li>Sent file: <?php echo $_FILES['image']['name'];  ?>
            <li>File size: <?php echo $_FILES['image']['size'];  ?>
            <li>File type: <?php echo $_FILES['image']['type'] ?>
         </ul>
			
      </form>
      
   </body>
</html>


