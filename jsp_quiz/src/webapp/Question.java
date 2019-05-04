package webapp;

public class Question {
  private int id;
  private String question;
  private String answer;

  public Question() {
    id = 0;
    question = "question";
    answer = "answer";
  }

  public Question(int id, String question, String answer) {
    this.id = id;
    this.question = question;
    this.answer = answer;
  }

  public void setID(int newID) {
    this.id = newID;
  }

  public void setQuestion(String newQuestion) {
    this.question = newQuestion;
  }

  public void setAnswer(String newAnswer) {
    this.answer = newAnswer;
  }

  public int getId() {
    return this.id;
  }

  public String getQuestion() {
    return this.question;
  }

  public String getAnswer() {
    return this.answer;
  }
}
