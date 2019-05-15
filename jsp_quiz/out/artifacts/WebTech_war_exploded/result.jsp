<%@ page import="java.util.ArrayList" %>
<%@ page import="webapp.Question" %>
<%--
  Created by IntelliJ IDEA.
  User: Dominic
  Date: 5/3/2019
  Time: 11:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  <%
    ArrayList<Question> questions = new ArrayList<>();
    questions = (ArrayList<Question>) session.getAttribute("questions");
  %>
    <div class="uk-section uk-section-muted uk-flex uk-flex-middle uk-animation-fade" uk-height-viewport>
      <div class="uk-margin uk-width-xlarge uk-margin-auto uk-card uk-card-default uk-card-body uk-box-shadow-xlarge">
        <h3 class="uk-card-title uk-text-center">Score: </h3>
        <h1 class="uk-card-title uk-text-center"> ${result} / <% out.print(questions.size()); %></h1>
        <br>
        <form role="form" autocomplete="off" action="/quiz" method="POST">
          <input class="uk-button uk-button-primary uk-button-large uk-width-1-1" value="Review Quiz" name="activity" type="submit">
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
