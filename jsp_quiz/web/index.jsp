<%--
  Created by IntelliJ IDEA.
  User: Dominic
  Date: 4/24/2019
  Time: 2:48 AM
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

<div class="container-fluid bg-light py-4">
  <form class="form" role="form" autocomplete="off" action="/quiz" method="POST">
    <div class="row">
      <div class="col-md-4 mx-auto">
        <div class="card card-body">
          <h3 class="text-center mb-4">Create Quiz</h3>

          <!-- <div class="alert alert-danger">
              <a class="close font-weight-light" data-dismiss="alert" href="#">×</a>Error: Example
          </div> -->

          <div class="form-group">
            <select class="form-control input-lg" id="category" name="category">
              <option value="0" selected>Topic Categories</option>
              <option value="1">Category 1</option>
              <option value="2">Category 2</option>
              <option value="3">Category 3</option>
            </select>
          </div>

          <div class="form-group">
            <select class="form-control input-lg" id="type" name="type">
              <option value="0" selected>Type of Quiz</option>
              <option value="1">Type 1</option>
              <option value="2">Type 2</option>
            </select>
          </div>

          <div class="form-group">
            <input class="form-control input-lg" placeholder="Number of Items" name="num_items" type="text">
          </div>

          <input class="btn btn-lg btn-primary btn-block" value="Start Quiz" name="activity" type="submit">
        </div>
      </div>
    </div>
  </form>
</div>

<!-- scripts -->
<script type="text/javascript" src="jquery-3.3.1.slim.min"></script>
<script type="text/javascript" src="popper.min.js"></script>
<script type="text/javascript" src="bootstrap.min.js"></script>
<script type="text/javascript" src="script.js"></script>
<!-- scripts -->
</body>
</html>
