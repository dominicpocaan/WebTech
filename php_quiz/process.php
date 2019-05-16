<?php include 'database.php'; ?>
<?php session_start(); ?>
<?php 

	if (!isset($_SESSION['score'])){
	   $_SESSION['score'] = 0;
	}

if($_POST){
	$number = $_POST['number'];
	$selected_choice = $_POST['choice'];
	$next=$number+1;
	$total=4;

	$query="SELECT * FROM `questions`";
	$results = $mysqli->query($query) or die($mysqli->error.__LINE__);
	$total=$results->num_rows;

	
	$q = "select * from `choices` where question_number = $number and is_correct=1";
	$result = $mysqli->query($q) or die($mysqli->error.__LINE__);
	$row = $result->fetch_assoc();
	$correct_choice=$row['id'];



	
	if($correct_choice == $selected_choice){
		$_SESSION['score']++;
	}

	if($number == $total){
		header("Location: final.php");
		exit();
	} else {
	        header("Location: question.php?n=".$next."&score=".$_SESSION['score']);
	}
}
?>