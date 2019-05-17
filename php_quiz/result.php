<?php

  /*
    Created by: Dominic Pocaan
  */
	session_start();

	if (isset($_POST['activity'])) {
		if ($_POST['activity'] == 'Review Quiz') {
			$questions = unserialize($_SESSION['questions']);
			$_SESSION['questions'] = serialize($questions);

			header("Location: review.php");
		} else if ($_POST['activity'] == 'Start New Quiz') {
			header("Location: index.php");
		}
	}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>WebTech Quiz</title>
  <link rel="shortcut icon" href="images/logo.png">

  <!-- styles -->
  <link rel="stylesheet" type="text/css" href="styles/uikit.min.css">
  <link rel="stylesheet" type="text/css" href="styles/style.css">
  <!-- styles -->
</head>

<body>
	<?php
		$questions = unserialize($_SESSION['questions']);
		$result = $_SESSION['result'];
		$_SESSION['flag'] = true;
	?>
  <div class="uk-section uk-section-muted uk-flex uk-flex-middle uk-animation-fade" uk-height-viewport>
    <div class="uk-margin uk-width-xlarge uk-margin-auto uk-card uk-card-default uk-card-body uk-box-shadow-xlarge">
      <h3 class="uk-card-title uk-text-center">Score: </h3>
      <h1 class="uk-card-title uk-text-center"><?php echo $result . '/' . count($questions) ?></h1>
      <br>
      <form role="form" autocomplete="off" action="result.php" method="POST">
        <input class="uk-button uk-button-primary uk-button-large uk-width-1-1" value="Review Quiz" name="activity" type="submit">
        <input class="uk-button uk-button-primary uk-button-large uk-width-1-1" value="Start New Quiz" name="activity" type="submit">
      </form>
    </div>
  </div>
	<?php
		$_SESSION['questions'] = serialize($questions);
	?>

  <!-- scripts -->
  <script type="text/javascript" src="scripts/uikit.min.js"></script>
  <script type="text/javascript" src="scripts/uikit-icons.min.js"></script>
  <script type="text/javascript" src="script.js"></script>
  <!-- scripts -->
</body>
</html>