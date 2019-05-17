<?php
	
	/*
		Created by: Dominic Pocaan
		Class for creating object Question.
	*/

	class Question {
		private $id;            // Question id.
		private $category;      // Category of question.
		private $question;      // Question
		private $correctAnswer; // Correct answer for the question.
		private $answerA; 			// Answer for A 
		private $answerB; 			// Answer for B
		private $answerC; 			// Answer for C
		private $answerD; 			// Answer for D
		private $userAnswer; 		// User answer for the question.
		private $status; 				// Current status if the user answer is right or wrong.

		// public function __construc($id, $category, $question, $correctAnswer, $userAnswer, $status) {
		// 	$this->id = $id;
		// 	$this->category = $category;
		// 	$this->question = $question;
		// 	$this->correctAnswer = $correctAnswer;
		// 	$this->userAnswer;
		// 	$this->status;
		// }

		public function setID($newID) {
			$this->id = $newID;
		}

		public function setCategory($newCategory) {
			$this->category = $newCategory;
		}

		public function setQuestion($newQuestion) {
			$this->question = $newQuestion;
		}

		public function setCorrectAnswer($newCorrectAnswer) {
			$this->correctAnswer = $newCorrectAnswer;
		}

		public function setAnswerA($newAnswerA) {
			$this->answerA = $newAnswerA;
		}

		public function setAnswerB($newAnswerB) {
			$this->answerB = $newAnswerB;
		}

		public function setAnswerC($newAnswerC) {
			$this->answerC = $newAnswerC;
		}

		public function setAnswerD($newAnswerD) {
			$this->answerD = $newAnswerD;
		}

		public function setUserAnswer($newUserAnswer) {
			$this->userAnswer = $newUserAnswer;
		}

		public function setStatus($newStatus) {
			$this->status = $newStatus;
		}

		public function getID() {
			return $this->id;
		}

		public function getCategory() {
			return $this->category;
		}

		public function getQuestion() {
			return $this->question;
		}

		public function getCorrectAnswer() {
			return $this->correctAnswer;
		}

		public function getAnswerA() {
			return $this->answerA;
		}

		public function getAnswerB() {
			return $this->answerB;
		}

		public function getAnswerC() {
			return $this->answerC;
		}

		public function getAnswerD() {
			return $this->answerD;
		}

		public function getUserAnswer() {
			return $this->userAnswer;
		}

		public function getStatus() {
			return $this->status;
		}

		public function printQuestion() {
			return '{[id:' . $this->id . '], [category:' . $this->category . '], [question:' . $this->question . '], [correctAnswer:' . $this->correctAnswer . '], [userAnswer:' . $this->userAnswer . '], [status:' . $this->status . ']}'; 
		}
	}

?>