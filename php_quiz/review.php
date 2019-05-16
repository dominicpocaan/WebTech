<?php 

	session_start();

	include_once '/includes/question.php';

	if (isset($_POST['activity'])) {
		if ($_POST['activity'] == 'Start New Quiz') {
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
	?>
	<div class="uk-section uk-section-muted uk-flex uk-flex-middle uk-animation-fade" uk-height-viewport>
	  <div class="uk-margin uk-width-xlarge uk-margin-auto uk-card uk-card-default uk-card-body uk-box-shadow-xlarge" style="width: 70%;">
	    <h3 class="uk-card-title uk-text-center">Review Quiz: </h3>
	    <br>
	    <?php 
	    	for ($i = 0; $i < count($questions); $i++) {
	    		$answerA = $questions[$i]->getAnswerA();
	    		$answerB = $questions[$i]->getAnswerB();
	    		$answerC = $questions[$i]->getAnswerC();
	    		$answerD = $questions[$i]->getAnswerD();

	    		$userAnswer = $questions[$i]->getUserAnswer();

	    		$checkA = ' ';
	    		$checkB = ' ';
	    		$checkC = ' ';
	    		$checkD = ' ';

	    		if ($userAnswer == 'A') {
	    			$checkA = 'checked';
	    		} else if ($userAnswer == 'B') {
	    			$checkB = 'checked';
	    		} else if ($userAnswer == 'C') {
	    			$checkC = 'checked';
	    		} else if ($userAnswer == 'D') {
	    			$checkD = 'checked';
	    		}

	    		if ($questions[$i]->getStatus() == true) {
	    			echo '<div class="uk-alert-success" uk-alert>
										<p>' . $questions[$i]->getQuestion() . '</p>
										<div class="uk-container-expand" uk-grid>
										<div class="uk-width-1-2">
			                <label class="rbutton">A. ' . $answerA. '
			                  <input type="radio" value="A" name="' . $i . '" ' . $checkA . '>
			                  <span class="cmark"></span>
			                </label>
			              </div>

			              <div class="uk-width-1-2">
			                <label class="rbutton">B. '. $answerB .'
			                  <input type="radio" value="B" name="' . $i . '" ' . $checkB . '>
			                  <span class="cmark"></span>
			                </label>
			              </div>

			              <div class="uk-width-1-2">
			                <label class="rbutton">C. ' . $answerC. '
			                  <input type="radio" value="C" name="' . $i . '" ' . $checkC . '>
			                  <span class="cmark"></span>
			                </label>
			              </div>

			              <div class="uk-width-1-2">
			                <label class="rbutton">D. ' . $answerD. '
			                  <input type="radio" value="D" name="' . $i . '" ' . $checkD . '>
			                  <span class="cmark"></span>
			                </label>
			              </div>
									</div>
									</div>
	    					 ';
	    		} else {
	    			echo '<div class="uk-alert-danger" uk-alert>
										<p>' . $questions[$i]->getQuestion() . '</p>
										<div class="uk-container-expand" uk-grid>
										<div class="uk-width-1-2">
			                <label class="rbutton">A. ' . $answerA. '
			                  <input type="radio" value="A" name="' . $i . '" ' . $checkA . '>
			                  <span class="cmark"></span>
			                </label>
			              </div>

			              <div class="uk-width-1-2">
			                <label class="rbutton">B. '. $answerB .'
			                  <input type="radio" value="B" name="' . $i . '" ' . $checkB . '>
			                  <span class="cmark"></span>
			                </label>
			              </div>

			              <div class="uk-width-1-2">
			                <label class="rbutton">C. ' . $answerC. '
			                  <input type="radio" value="C" name="' . $i . '" ' . $checkC . '>
			                  <span class="cmark"></span>
			                </label>
			              </div>

			              <div class="uk-width-1-2">
			                <label class="rbutton">D. ' . $answerD. '
			                  <input type="radio" value="D" name="' . $i . '" ' . $checkD . '>
			                  <span class="cmark"></span>
			                </label>
			              </div>
									</div>
									</div>
	    					 ';
	    		}

	    		$checkA = ' ';
	    		$checkB = ' ';
	    		$checkC = ' ';
	    		$checkD = ' ';
	    	}
	    ?>
	    <form role="form" autocomplete="off" action="review.php" method="POST">
	      <input class="uk-button uk-button-primary uk-button-large uk-width-1-1" value="Start New Quiz" name="activity" type="submit">
	    </form>
	  </div>
	</div>

	<!-- scripts -->
	<script type="text/javascript" src="scripts/uikit.min.js"></script>
	<script type="text/javascript" src="scripts/uikit-icons.min.js"></script>
	<script type="text/javascript" src="script.js"></script>
	<!-- scripts -->
</body>
</html>