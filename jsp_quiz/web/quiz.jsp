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
  <!-- <link rel="shortcut icon" href=""> -->

  <!-- styles -->
  <link rel="stylesheet" type="text/css" href="styles/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="styles/style.css">
  <!-- styles -->
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="#">WebTech Quiz</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <!-- <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li> -->
      </ul>
    </div>
  </nav>

  <div class="jumbotron">
    <div class="container">

    </div>
  </div>
  <%
    ArrayList<Question> questions = new ArrayList<>();
    questions = (ArrayList<Question>) session.getAttribute("questions");
    int itemNumber = (int) session.getAttribute("itemNumber");
  %>
  <div class="container-fluid bg-light py-4">
    <form class="form" role="form" autocomplete="off" action="/quiz" method="POST">
      <div class="row">
        <div class="col-md-6 mx-auto">
          <div class="card card-body">
            <h3 class="text-center mb-4">Question #<% out.print(itemNumber + 1); %></h3>
            <%
              out.print("<p>" + questions.get(itemNumber).getQuestion() + "</p>");
            %>
            <br>
            <div class="row">
              <div class="col-md-6 mx-auto">
                <div class="d-flex justify-content-center">
                  <%
                    if (itemNumber == 0 && questions.size() > 1) {
                      out.print("<input class=\"btn btn-primary\" value=\"Next\" name=\"activity\" type=\"submit\">");
                    } else if (itemNumber == questions.size() - 1 && questions.size() > 1){
                      out.print("<input class=\"btn btn-primary\" value=\"Previous\" name=\"activity\" type=\"submit\">");
                      out.print("<br><br><input class=\"btn btn-lg btn-outline-primary btn-block\" value=\"Submit\" name=\"activity\" name type=\"submit\">");
                    } else if (questions.size() > 1) {
                      out.print("<input class=\"btn btn-primary\" value=\"Previous\" name=\"activity\" type=\"submit\" style=\"margin-right: 20px;\">");
                      out.print("<input class=\"btn btn-primary\" value=\"Next\" name=\"activity\" type=\"submit\">");
                    }
                  %>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>

  <div class="container bg-light py-4">
    <form class="form" role="form" autocomplete="off" action="/check" method="POST">
      <h4>Questions Status: </h4>
      <hr>
      <%
        for (int i = 0; i < questions.size(); i++) {
          if (questions.get(i).getUserAnswer() != null) {
            out.print("<div class=\"text-center alert alert-success\" role=\"alert\" style=\"float: left; width:148px; margin: 5px 5px 0px 5px;\"> Question #" + (i + 1) + "</div>");
          } else {
            out.print("<div class=\"text-center alert alert-danger\" role=\"alert\" style=\"float: left; width: 148px; margin: 5px 5px 0px 5px;\"> Question #" + (i + 1) + "</div>");
          }
        }
      %>
      <div class="clearfix"></div>
    </form>
  </div>

  <div class="container">
    <h1>Test: Current Data</h1>
    <%
      for (int i = 0; i < questions.size(); i++) {
        out.print("<p> " + questions.get(i).getQuestion() + "</p>");
      }
    %>
  </div>

  <!-- scripts -->
  <script type="text/javascript" src="jquery-3.3.1.slim.min"></script>
  <script type="text/javascript" src="popper.min.js"></script>
  <script type="text/javascript" src="bootstrap.min.js"></script>
  <script type="text/javascript" src="script.js"></script>
  <!-- scripts -->
</body>
</html>
