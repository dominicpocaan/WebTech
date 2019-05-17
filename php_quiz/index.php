<!-- Created by: Dominic Pocaan -->
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
  <div class="uk-child-width-1-2" uk-grid>
    <div>
      <div class="uk-section uk-section-muted uk-flex uk-flex-middle uk-animation-fade" uk-height-viewport>
        <img src="images/logo.png" style="width: 90%; margin-left: 10%;">
      </div>
    </div>

    <div>
      <div class="uk-section uk-section-muted uk-flex uk-flex-middle uk-animation-fade" uk-height-viewport>
        <div class="uk-margin uk-width-xlarge uk-margin-auto uk-card uk-card-default uk-card-body uk-box-shadow-large">
          <h3 class="uk-card-title uk-text-center">Create Quiz</h3>
          <?php
            session_start();

            if (isset($_SESSION['error'])) {
              $error = $_SESSION['error'];

              if ($error != null) {
                echo '
                  <div class="uk-alert-danger" uk-alert>
                    <a class="uk-alert-close" uk-close></a>
                    <p>' . $error . '</p>
                  </div>
                ';
              }
            }
            
          ?>
          <form role="form" autocomplete="off" action="quiz.php" method="POST">
            <div class="uk-margin">
              <label class="uk-form-label" for="category" style="font-size: 16px;">1. Select Category of Quiz Questions.</label>
              <div class="uk-form-controls">
                <select class="uk-select uk-form-large" id="category" name="category">
                  <option value="0">Front End: HTML, CSS</option>
                  <option value="1">Scripting: JavaScript</option>
                  <option value="2">Back End: PHP, Node.js, JavaServlet</option>
                </select>
              </div>
            </div>

            <div class="uk-margin">
              <label class="uk-form-label" for="num_items" style="font-size: 16px;">2. Input Number of Quiz Items (1 - 30)</label>
              <div class="uk-form-controls">
                <input class="uk-input uk-form-large" id="num_items" value="0" placeholder="Number of Items" name="num_items" type="text">
              </div>
            </div>

            <div class="uk-margin">
              <input class="uk-button uk-button-primary uk-button-large uk-width-1-1" value="Start Quiz" name="activity" type="submit">
            </div>
          </form>
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