package webapp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by: Dominic Pocaan
 * Servlet for creating new quiz,
 * previous, next and submit,
 * review quiz and show result.
 */
@WebServlet(name = "QuizServlet")
public class QuizServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    ArrayList<Question> questions = null;                  // Variable that will store queried questions from the database.
    ArrayList<String> orgQuestion = new ArrayList<>();     // Variable that will store original question string.
    String activity = request.getParameter("activity"); // Current user button clicked.
    HttpSession session = request.getSession();           // Start new session.

    // If user activity is Start Quiz.
    if (activity.equals("Start Quiz")) {
      // Check if user input in Number of Items is correct.
      // No need to check for type and category because they
      // have a default value.
      if (Integer.parseInt(request.getParameter("num_items")) == 0 || Integer.parseInt(request.getParameter("num_items")) > 30) {
        request.setAttribute("error", "Invalid input for number of items. Valid input 0 to 30 number of items.");
        request.getRequestDispatcher("/index.jsp").forward(request, response);
      }

      // If type is equal to multiple choice redirect to php page.
      if (Integer.parseInt(request.getParameter("type")) == 0) {
        request.getRequestDispatcher("/index.jsp").forward(request, response);
      } else {
        // Query questions for the quiz according to the user input.
        try {
          questions = new Database().getQuestions(Integer.parseInt(request.getParameter("num_items")), Integer.parseInt(request.getParameter("category")));
        } catch (SQLException e) {
          e.printStackTrace();
        }

        for (int x = 0; x < questions.size(); x++) {
          orgQuestion.add(questions.get(x).getQuestion());
          questions.get(x).setQuestion(questions.get(x).getQuestion().replace("question", "<input name=\"user_answer\" type=\"text\" style=\"width: " + (questions.get(x).getCorrectAnswer().length() * 15) +"px;\">"));
        }

        // Start session for original string question,
        // ArrayList of questions and current item number.
        session.setAttribute("orgQuestion", orgQuestion);
        session.setAttribute("questions", questions);
        session.setAttribute("itemNumber", 0);
      }
      // If user activity is Previous.
    } else if (activity.equals("Previous")) {
      int previousItemNumber = (int) session.getAttribute("itemNumber") - 1;
      session.setAttribute("itemNumber", previousItemNumber);
      // If user activity is Next
    } else if (activity.equals("Next")) {
      int nextItemNumber = (int) session.getAttribute("itemNumber") + 1;
      session.setAttribute("itemNumber", nextItemNumber);
    }

    // Make sure that each user answer for question is saved in the current session.
    if (activity.equals("Next") || activity.equals("Previous") || activity.equals("Submit")) {
      questions = (ArrayList<Question>) session.getAttribute("questions");

      int currentItemNumber = (int) session.getAttribute("itemNumber");
      if (activity.equals("Next")) {
        currentItemNumber--;
      } else if (activity.equals("Previous")) {
        currentItemNumber++;
      } else if (activity.equals("Submit")) {
        currentItemNumber = questions.size() - 1;
      }

      ArrayList<String> sessionOrgQuestion;
      ArrayList<Question> sessionQuestions;
      sessionQuestions = (ArrayList<Question>) session.getAttribute("questions");
      sessionOrgQuestion = (ArrayList<String>) session.getAttribute("orgQuestion");

      String userAnswer = request.getParameter("user_answer");
      session.setAttribute("previousAnswer", userAnswer);
      if (userAnswer.replaceAll("\\s+","").length() != 0) {
        sessionQuestions.get(currentItemNumber).setUserAnswer(userAnswer);
        sessionQuestions.get(currentItemNumber).setQuestion(sessionOrgQuestion.get(currentItemNumber).replace("question", "<input value=\"" + userAnswer + "\"name=\"user_answer\" type=\"text\" style=\"width: " + (sessionQuestions.get(currentItemNumber).getCorrectAnswer().length() * 15) +"px\">"));
      }

      session.setAttribute("orgQuestion", sessionOrgQuestion);
      session.setAttribute("questions", sessionQuestions);
    }

    // If user activity is Submit.
    if (activity.equals("Submit")) {
      questions = (ArrayList<Question>) session.getAttribute("questions");
      int result = 0;

      for (int i = 0; i < questions.size(); i++) {
        String userAnswer = "";
        if (questions.get(i).getUserAnswer() != null) {
          userAnswer = questions.get(i).getUserAnswer().toLowerCase();
        }
        String correctAnswer = questions.get(i).getCorrectAnswer().toLowerCase();

        if (userAnswer == null) {
          userAnswer = "blank";
        }

        if (userAnswer.equals(correctAnswer)) {
          questions.get(i).setStatus(true);
          result++;
        }
      }

      request.setAttribute("result", result);
      request.getRequestDispatcher("/result.jsp").forward(request, response);
    }

    // If user activity is Review Quiz.
    if (activity.equals("Review Quiz")) {
      request.getRequestDispatcher("/review.jsp").forward(request, response);
    }

    // If user activity is Start New Quiz.
    if (activity.equals("Start New Quiz")) {
      request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    request.getRequestDispatcher("/quiz.jsp").forward(request, response);
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

  }
}
