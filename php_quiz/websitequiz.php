<!DOCTYPE html>

<?php
    $servername="localhost";
    $username="root";
    $password="";
    $dbname="websitequiz";
        try{
            $conn = mysqli_connect($servername, $username, $password, $dbname);
           // echo("success!");
        }
            catch(MYSQLi_Sql_Exception $ex){
                echo("error!");
            }
            if(isset($_POST['submit'])){
                $question=$_POST['question'];
                $query="INSERT INTO question (question) VALUES ('$question')";
                try{
                    $result = mysqli_query($conn, $query);
                    if($result){
                        if(mysqli_affected_rows($conn)>0){
                           // echo "submitted successfully";
                        }
                        else{
                            echo "error";
                        }
                    }
                }catch(Exception $ex){
                    echo ("errror connection");
                }
                $querytwo = "SELECT question.question, answer.answer FROM answer INNER JOIN (SELECT question FROM question ORDER BY id DESC LIMIT 1) AS question ON question.question = answer.answer";
                $resulttwo = mysqli_query($conn, $querytwo);
                if($resulttwo){
                    if(mysqli_affected_rows($conn)>0){
                        $querythree="INSERT INTO `compare`(`value`) values ('correct')";
                        $resultthree=mysqli_query($conn, $querythree);
                    }else{
                            $querythree ="INSERT INTO compare (value) values ('incorrect')";
                            $resultthree=mysqli_query($conn, $querythree);
                        }
                    }
                }  
                
            if(isset($_POST['check'])){
                $queryfour = "SELECT value FROM compare ORDER BY id DESC LIMIT 1";
                $resultfour = mysqli_query($conn, $queryfour);
                if($resultfour){
                    if(mysqli_num_rows($resultfour)){
                        while($rows = mysqli_fetch_array($resultfour, MYSQL_BOTH)){
                            echo($rows['value']."<br>");
                        
                        }
                    }
                } else{
                    echo "error result";
                }
            }
?>

<html>
<head>
    <meta charset="utf-8">
    <title>Quiz</title>
</head>

<body>
    <form action="" method="POST">
        <table align="center">
        <tr>
            <td>HTML stands for?</td>
        </tr>
        <tr>
            <td></td>
            <td><input type="radio" name="question" value="answer0">Hyper Text Markup Language</td>
        </tr>
        <tr>
            <td></td>
            <td><input type="radio" name="question" value="answer1">Hyper Tabular Markup Language</td>
        </tr>
        <tr>
            <td></td>
            <td><input type="radio" name="question" value="answer2">High Text Markup Language</td>
        </tr>
        <tr>
            <td></td>
            <td><input type="radio" name="question" value="answer3">None of these</td>
        </tr>
        <tr>
            <td><input type="submit" name="check" value="Check Result"></td>
            <td><input type="submit" name="submit" value="Submit"></td>
        </tr>
        </table>
</body>
</html>