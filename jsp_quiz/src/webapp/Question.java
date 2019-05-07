package webapp;

public class Question {
  private int id;
  private int category;
  private String question;
  private String correctAnswer;
  private String userAnswer;

  public Question() {
    id = 0;
    category = 0;
    question = "question";
    correctAnswer = "correctAnswer";
    userAnswer = "userAnswer";
  }

  public Question(int id, int category, String question, String correctAnswer, String userAnswer) {
    this.id = id;
    this.category = category;
    this.question = question;
    this.correctAnswer = correctAnswer;
    this.userAnswer = userAnswer;
  }

  public void setID(int newID) {
    this.id = newID;
  }

  public void setCategory(int newCategory) {
    this.category = newCategory;
  }

  public void setQuestion(String newQuestion) {
    this.question = newQuestion;
  }

  public void setCorrectAnswer(String newCorrectAnswer) {
    this.correctAnswer = newCorrectAnswer;
  }

  public void setUserAnswer(String newUserAnswer) {
    this.userAnswer = newUserAnswer;
  }

  public int getId() {
    return this.id;
  }

  public int getCategory() {
    return  this.category;
  }

  public String getQuestion() {
    return this.question;
  }

  public String getCorrectAnswer() {
    return this.correctAnswer;
  }

  public String getUserAnswer() {
    return  this.userAnswer;
  }

  public String printQuestion() {
    return "{[id:" + this.id + "], [category:" + this.category + "], [question:" + this.question + "], [correctAnswer:" + this.correctAnswer + "], [userAnswer:" + this.userAnswer + "]}     ";
  }
}
