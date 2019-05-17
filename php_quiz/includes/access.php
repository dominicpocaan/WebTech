<?php
	/*
		Created by: Dominic Pocaan
		Class for Database connection.
	*/
	include_once 'question.php';

	class Access {
		// Connect to the databse.
	  public function connect() {
	    $conn = new mysqli('localhost', 'root', 'root', 'quiz');
	    if ($conn->connect_error) {
			    die("Connection failed: " . $conn->connect_error);
			} 
	    return $conn;
	  }

	  // Close database connection.
	  public function disconnect($conn) {
	  	$conn->close();
	  }

	  // Query all questions in the database put in array then return.
	  public function getQuestions($num_items, $category) {
	  	$db = new Access();
	    $conn = $db->connect();

	  	$sql = "SELECT * FROM multiplechoice;";
	    $result = $conn->query($sql);
	    $numRows = $result->num_rows;

	    $questions = array();

	    $counter = 0;

	    if ($numRows > 0) {
	      while ($row = $result->fetch_assoc()) {
	        $question = new Question();

	        $question->setID($row['id']);
	        $question->setCategory($row['category']);
	        $question->setQuestion($row['question']);
	        $question->setCorrectAnswer($row['correctAnswer']);
	        $question->setAnswerA($row['A']);
	        $question->setAnswerB($row['B']);
	        $question->setAnswerC($row['C']);
	        $question->setAnswerD($row['D']);
	        $question->setUserAnswer(null);
	        $question->setStatus(false);

	        if ($category == $row['category']) {
	        	$questions[] = $question;
	        	$counter++;
	        }

	        if ($counter == $num_items) {
	        	break;
	        }
	      }
		  }

		  return $questions;
	    $db->disconnect($conn);
	  }
	}

?>