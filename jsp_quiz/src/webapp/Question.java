package webapp;

/**
 * Created by: Dominic Pocaan
 * Class for question.
 */
public class Question {
  private int id;               // Question id.
  private int category;         // Category of question.
  private String question;      // Question.
  private String correctAnswer; // Correct answer for the question.
  private String userAnswer;    // User answer for the question.
  private boolean status;       // Current status if the user answer is right or wrong.

  /**
   * Default constructor.
   */
  public Question() {
    id = 0;
    category = 0;
    question = "question";
    correctAnswer = "correctAnswer";
    userAnswer = "userAnswer";
    status = false;
  }

  /**
   * Constructor with parameter.
   * @param id Question id.
   * @param category Category of question.
   * @param question Question.
   * @param correctAnswer Correct answer for the question.
   * @param userAnswer User answer for the question.
   * @param status Current status if the user answer is right or wrong.
   */
  public Question(int id, int category, String question, String correctAnswer, String userAnswer, boolean status) {
    this.id = id;
    this.category = category;
    this.question = question;
    this.correctAnswer = correctAnswer;
    this.userAnswer = userAnswer;
    this.status = status;
  }

  /**
   * Set new id for the question.
   * @param newID New question id.
   */
  public void setID(int newID) {
    this.id = newID;
  }

  /**
   * Set new category for the question.
   * @param newCategory New question category.
   */
  public void setCategory(int newCategory) {
    this.category = newCategory;
  }

  /**
   * Set new question.
   * @param newQuestion New question.
   */
  public void setQuestion(String newQuestion) {
    this.question = newQuestion;
  }

  /**
   * Set new correct answer for the question.
   * @param newCorrectAnswer New correct answer for the question.
   */
  public void setCorrectAnswer(String newCorrectAnswer) {
    this.correctAnswer = newCorrectAnswer;
  }

  /**
   * Set new user answer for the question.
   * @param newUserAnswer New user answer for the question.
   */
  public void setUserAnswer(String newUserAnswer) {
    this.userAnswer = newUserAnswer;
  }

  /**
   * Set new status for the question.
   * @param newStatus New status for the question.
   */
  public void setStatus(boolean newStatus) {
    this.status = newStatus;
  }

  /**
   * Get question id.
   * @return Question id.
   */
  public int getId() {
    return this.id;
  }

  /**
   * Get question category/
   * @return Question category.
   */
  public int getCategory() {
    return  this.category;
  }

  /**
   * Get question.
   * @return Question.
   */
  public String getQuestion() {
    return this.question;
  }

  /**
   * Get question correct answer.
   * @return Question correct answer.
   */
  public String getCorrectAnswer() {
    return this.correctAnswer;
  }

  /**
   * Get user answer for the question.
   * @return User answer for the question.
   */
  public String getUserAnswer() {
    return  this.userAnswer;
  }

  /**
   * Get question status.
   * @return Question status.
   */
  public boolean getStatus() {
    return this.status;
  }

  /**
   * Question toString.
   * @return Question string.
   */
  public String printQuestion() {
    return "{[id:" + this.id + "], [category:" + this.category + "], [question:" + this.question + "], [correctAnswer:" + this.correctAnswer + "], [userAnswer:" + this.userAnswer + "]}     ";
  }
}
