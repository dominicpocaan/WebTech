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
	      <input type="hidden" name="number" value="<?php echo $number; ?>" />
				<?php
				mysqli_select_db($mysqli, 'pagination');
				$results_per_page = 1;

				$query = "SELECT * FROM questions";
				$result = mysqli_query($mysqli,$query);
				$number_of_results = mysqli_num_rows($result);

				

				$number_of_pages = ceil($number_of_results/$results_per_page);

				if (!isset($_GET['page'])){
					$page = 1;
				}else{
					$page = $_GET['page'];
				}

				$this_page_first_result = ($page-1)*$results_per_page;
				$query = "SELECT * FROM questions LIMIT " . $this_page_first_result . ',' . $results_per_page;
				$result = mysqli_query($mysqli,$query);
				while ($row = mysqli_fetch_array($result)){
					echo $row['question_number'] . ' ' . $row['question'] . '<br>';
				}


				for ($page=1;$page<=$number_of_pages;$page++) {
					echo '<a href="question.php?page=' . $page . '">' . $page . '</a>';
				}
				?>
	</form>
		
      </div>
    </div>
    </main>
  </body>
</html>