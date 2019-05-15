<?php include "database.php"; ?>
<?php session_start(); ?>
<?php

	$number = (int) $_GET['n'];


	$query = "SELECT * FROM questions";
	$results = $mysqli->query($query) or die($mysqli->error.__LINE__);
	$total=$results->num_rows;


	$query = "SELECT * FROM `questions` where question_number = $number";


	$result = $mysqli->query($query) or die($mysqli->error.__LINE__);
	$question = $result->fetch_assoc();



	$query = "SELECT * FROM `choices` where question_number = $number";


	$choices = $mysqli->query($query) or die($mysqli->error.__LINE__);

 ?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>QUIZ</title>
		<link rel="stylesheet" href="css/style.css" type="text/css" />
		
		<style>
		a{
    text-decoration:none;
    display: inline-block;
    padding: 8px 16px;
}
a:hover{
    background-color: #ddd;
    color: black;
}

.previous{
    background-color:#flflfl;
    color:black;
}
.next{
    background-color: #4caff0;
    color: white;
    border-radius:5px;
}
		</style>
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
        <div class="current">Question <?php echo $number; ?> of <?php echo $total; ?></div>
	<p class="question">
	   <?php echo $question['question'] ?>
	</p>
	<form method="post" action="process.php">
	      <ul class="choices">
	        <?php while($row=$choices->fetch_assoc()): ?>
		<li><input name="choice" type="radio" value="<?php echo $row['id']; ?>" />
		  <?php echo $row['choice']; ?>
		</li>
		<?php endwhile; ?>
	      </ul>
	      <input type="submit" value="submit" />
				<a href="question.php" class="previous">&laquo;previous </a>
				<a href="question.php" class="next">Next&raquo; </a>
	      <input type="hidden" name="number" value="<?php echo $number; ?>" />
	</form>
      </div>
    </div>
    </main>
  </body>
</html>