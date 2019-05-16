 <?php include "database.php"; ?>
<?php session_start(); ?>
<?php
	
	$query="SELECT * FROM shouts order BY time DESC LIMIT 100";
	$shouts = mysqli_query($mysqli,$query);

 ?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>QUIZ</title>
    <link rel="stylesheet" href="css/style.css" type="text/css" />
  </head>
  <body>
    <div id="container">
      <header>
        <div class="container">
          <h1>QUIZ</h1>
	</div>
      </header>


      <main>
	<div class="container">
	     <h2></h2>
	     <p></p>
	     <p>Final score: <?php echo $_SESSION['score']; ?></p>
	     <a href="question.php?n=1" class="start">Take Test Again</a>
	     <?php session_destroy(); ?>
	</div>
      </main>

  </body>
</html>