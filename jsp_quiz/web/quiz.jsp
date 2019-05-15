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
    int itemNumber = (int) session.getAttribute("itemNumber");
  %>
  <div class="uk-container-expand" uk-grid>
    <div class="uk-width-3-4">
      <div class="uk-section uk-section-muted uk-flex uk-flex-middle uk-animation-fade" uk-height-viewport>
        <div class="uk-margin uk-width-xlarge uk-margin-auto uk-card uk-card-default uk-card-body uk-box-shadow-xlarge" style="width: 70%;">
          <h3 class="uk-card-title uk-text-center">Question #<% out.print(itemNumber + 1); %></h3>
          <form role="form" autocomplete="off" action="/quiz" method="POST">
            <%
              out.print("<p>" + questions.get(itemNumber).getQuestion() + "</p>");
            %>
            <hr>
            <ul class="uk-pagination">
              <%
                if (itemNumber == 0 && questions.size() > 1) {
                  out.print("<li class=\"uk-margin-auto-left\"><input class=\"uk-button uk-button-primary\" value=\"Next\" name=\"activity\" type=\"submit\" style=\"color: #fff;\"></li>");
                } else if (itemNumber == questions.size() - 1 && questions.size() > 1){
                  out.print("<li><input class=\"uk-button uk-button-primary\" value=\"Previous\" name=\"activity\" type=\"submit\" style=\"color: #fff;\"></li>");
                } else if (questions.size() > 1) {
                  out.print("<li><input class=\"uk-button uk-button-primary\" value=\"Previous\" name=\"activity\" type=\"submit\" style=\"color: #fff;\"></li>");
                  out.print("<li class=\"uk-margin-auto-left\"><input class=\"uk-button uk-button-primary\" value=\"Next\" name=\"activity\" type=\"submit\" style=\"color: #fff;\"></li>");
                }
              %>
            </ul>

            <%
              if (questions.size() == 1 || itemNumber == questions.size() - 1) {
                out.print("<input class=\"uk-button uk-button-primary uk-width-1-1 uk-margin-small-bottom\" value=\"Submit\" name=\"activity\" type=\"submit\">");
              }
            %>
          </form>
        </div>
      </div>
    </div>

    <div class="uk-width-1-4">
      <div class="uk-section uk-section-muted uk-flex uk-flex-middle uk-animation-fade" uk-height-viewport>
        <div class="uk-margin uk-width-xlarge uk-margin-auto uk-card uk-card-default uk-card-body uk-box-shadow-xlarge" style="">
          <h3 class="uk-card-title uk-text-center">Quiz Checklist</h3>
          <hr>
          <%
            for (int i = 0; i < questions.size(); i++) {
              if (questions.get(i).getUserAnswer() != null) {
                out.print("<div style=\"padding: 2px; background-color: green; color: white; text-align: center; width: 23px; float: left; margin: 5px 5px 5px 5px;\">\n" +
                        "            " + (i + 1) + "\n" +
                        "          </div>");
              } else {
                out.print("<div style=\"padding: 2px; background-color: red; color: white; text-align: center; width: 23px; float: left; margin: 5px 5px 5px 5px;\">\n" +
                        "            " + (i + 1) + "\n" +
                        "          </div>");
              }
            }
          %>
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
