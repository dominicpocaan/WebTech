<?php
  session_start();

  include_once '/includes/question.php';
  include_once '/includes/access.php';

  if ($_POST['activity'] == 'Start Quiz') {
    $category = $_POST['category'];
    $num_items = $_POST['num_items'];

    $access = new Access();
    $questions = $access->getQuestions($num_items, $category);

    $_SESSION['questions'] = serialize($questions);
    $_SESSION['itemNumber'] = 0;
  } else if ($_POST['activity'] == 'Previous') {
    $previousItemNumber = $_SESSION['itemNumber'] - 1;
    $_SESSION['itemNumber'] = $previousItemNumber;
  } else if ($_POST['activity'] == 'Next') {
    $nextItemNumber = $_SESSION['itemNumber'] + 1;
    $_SESSION['itemNumber'] = $nextItemNumber;
  }

  if ($_POST['activity'] == 'Next'|| $_POST['activity'] == 'Previous' || $_POST['activity'] == 'Submit') {
    $sessionQuestions = unserialize($_SESSION['questions']);

    $currentItemNumber = $_SESSION['itemNumber'];
    if ($_POST['activity'] == 'Next') {
      $currentItemNumber--;
    } else if ($_POST['activity'] == 'Previous') {
      $currentItemNumber++;
    } else if ($_POST['activity'] == 'Submit') {
      $currentItemNumber = count($sessionQuestions) - 1;
    }

    if (isset($_POST['useranswer'])) {
      $sessionQuestions[$currentItemNumber]->setUserAnswer($_POST['useranswer']);
    }

    $_SESSION['questions'] = serialize($sessionQuestions);
  }

  if ($_POST['activity'] == 'Submit') {
    $questions = unserialize($_SESSION['questions']);
    $result = 0;

    for ($i = 0; $i < count($questions); $i++) {
      $userAnswer;
      if ($questions[$i]->getUserAnswer() != null) {
        $userAnswer = $questions[$i]->getUserAnswer();
      }
      $correctAnswer = $questions[$i]->getCorrectAnswer();

      if ($userAnswer == null) {
        $userAnswer = "blank";
      }

      if ($userAnswer == $correctAnswer) {
        $questions[$i]->setStatus(true);
        $result++;
      }
    }

    $_SESSION['result'] = $result;
    $_SESSION['questions'] = serialize($questions);

    header("Location: result.php");
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
    $itemNumber = $_SESSION['itemNumber'];

  ?>
  <div class="uk-container-expand" uk-grid>
    <div class="uk-width-3-4">
      <div class="uk-section uk-section-muted uk-flex uk-flex-middle uk-animation-fade" uk-height-viewport>
        <div class="uk-margin uk-width-xlarge uk-margin-auto uk-card uk-card-default uk-card-body uk-box-shadow-xlarge" style="width: 70%;">
          <h3 class="uk-card-title uk-text-center">Question #<?php echo $itemNumber + 1; ?></h3>
          <form role="form" autocomplete="off" action="quiz.php" method="POST">
            <hr>
            <?php
              echo '<p>' . $questions[$itemNumber]->getQuestion() . '</p>'; 
            ?>
            <div class="uk-container-expand" uk-grid>
              <div class="uk-width-1-2">
                <label class="rbutton">A. <?php echo $questions[$itemNumber]->getAnswerA(); ?>
                  <input type="radio" value="A" name="useranswer" <?php if ($questions[$itemNumber]->getUserAnswer() != null) { if ($questions[$itemNumber]->getUserAnswer() == 'A') { echo 'checked';} }?>>
                  <span class="cmark"></span>
                </label>
              </div>

              <div class="uk-width-1-2">
                <label class="rbutton">B. <?php echo $questions[$itemNumber]->getAnswerB(); ?>
                  <input type="radio" value="B" name="useranswer" <?php if ($questions[$itemNumber]->getUserAnswer() != null) { if ($questions[$itemNumber]->getUserAnswer() == 'B') { echo 'checked';} }?>>
                  <span class="cmark"></span>
                </label>
              </div>

              <div class="uk-width-1-2">
                <label class="rbutton">C. <?php echo $questions[$itemNumber]->getAnswerC(); ?>
                  <input type="radio" value="C" name="useranswer" <?php if ($questions[$itemNumber]->getUserAnswer() != null) { if ($questions[$itemNumber]->getUserAnswer() == 'C') { echo 'checked';} }?>>
                  <span class="cmark"></span>
                </label>
              </div>

              <div class="uk-width-1-2">
                <label class="rbutton">D. <?php echo $questions[$itemNumber]->getAnswerD(); ?>
                  <input type="radio" value="D" name="radio" <?php if ($questions[$itemNumber]->getUserAnswer() != null) { if ($questions[$itemNumber]->getUserAnswer() == 'D') { echo 'checked';} }?>>
                  <span class="cmark"></span>
                </label>
              </div>
            </div>

            <ul class="uk-pagination">
              <?php
                if ($itemNumber == 0 && count($questions) > 1) {
                  echo '<li class="uk-margin-auto-left"><input class="uk-button uk-button-primary" value="Next" name="activity" type="submit" style="color: #fff;"></li>';
                } else if ($itemNumber == (count($questions) - 1) && count($questions) > 1) {
                  echo '<li><input class="uk-button uk-button-primary" value="Previous" name="activity" type="submit" style="color: #fff;"></li>';
                } else if (count($questions) > 1) {
                  echo '<li class="uk-margin-auto-left"><input class="uk-button uk-button-primary" value="Next" name="activity" type="submit" style="color: #fff;"></li>';
                }
              ?>
            </ul>
              <?php
                if (count($questions) == 1 || $itemNumber == (count($questions) - 1)) {
                  echo '<input class="uk-button uk-button-primary uk-width-1-1 uk-margin-small-bottom" value="Submit" name="activity" type="submit">';
                }
              ?>
          </form>
        </div>
      </div>
    </div>

    <div class="uk-width-1-4">
      <div class="uk-section uk-section-muted uk-flex uk-flex-middle uk-animation-fade" uk-height-viewport>
        <div class="uk-margin uk-width-xlarge uk-margin-auto uk-card uk-card-default uk-card-body uk-box-shadow-xlarge" style="">
          <h3 class="uk-card-title uk-text-center">Quiz Checklist</h3>
          <hr>
          <?php 
            for ($i = 0; $i < count($questions); $i++) {
              if ($questions[$i]->getUserAnswer() != null) {
                echo '<div style="padding: 2px; background-color: green; color: white; text-align: center; width: 23px; float: left; margin: 5px 5px 5px 5px">
                        ' . ($i + 1) . '
                      </div>';
              } else {
                echo '<div style="padding: 2px; background-color: red; color: white; text-align: center; width: 23px; float: left; margin: 5px 5px 5px 5px">
                        ' . ($i + 1) . '
                      </div>'; 
              }
            }
          ?>
        </div>
      </div>
    </div>
  </div>

  <!-- scripts -->
  <script type="text/javascript" src="scripts/uikit.min.js"></script>
  <script type="text/javascript" src="scripts/uikit-icons.min.js"></script>
  <script type="text/javascript" src="script.js"></script>
  <!-- scripts -->
</body>
</html>