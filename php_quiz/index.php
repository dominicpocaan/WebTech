 <?php include "database.php"; ?>

<?php
	
	$query="select * from questions";

	$results = $mysqli->query($query) or die ($mysqli->error.__LINE__);
	$total = $results->num_rows;

 ?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>QUIZ</title>
    <link rel="stylesheet" href="css/style.css" type="text/css" />
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />

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
       
          <p>This is a multiple choice quize to test your knowledge about something</p>
                <ul>
                      <li><strong>Number of Questions: </strong><?php echo $total; ?></ul>
                      <li><strong>Type: </strong>Multiple Choice</ul>
                </ul>
          <a href="question.php?n=1" class="start">Start Quiz</a>
      </div>
    </div>
    </main>
  </body>
</html>