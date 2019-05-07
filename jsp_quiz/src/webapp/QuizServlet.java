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

@WebServlet(name = "QuizServlet")
public class QuizServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    ArrayList<Question> questions = null;
    ArrayList<String> orgQuestion = new ArrayList<>();
    String activity = request.getParameter("activity");
    HttpSession session = request.getSession();

    if (activity.equals("Start Quiz")) {
      try {
        questions = new Database().getQuestions(Integer.parseInt(request.getParameter("num_items")));
      } catch (SQLException e) {
        e.printStackTrace();
      }

      for (int x = 0; x < questions.size(); x++) {
        orgQuestion.add(questions.get(x).getQuestion());
        questions.get(x).setQuestion(questions.get(x).getQuestion().replace("question", "<input name=\"user_answer\" type=\"text\" style=\"width: " + (questions.get(x).getCorrectAnswer().length() * 15) +"px\">"));
      }

      session.setAttribute("orgQuestion", orgQuestion);
      session.setAttribute("questions", questions);
      session.setAttribute("itemNumber", 0);
    } else if(activity.equals("Next")) {
      int nextItemNumber = (int) session.getAttribute("itemNumber") + 1;
      session.setAttribute("itemNumber", nextItemNumber);
    } else if(activity.equals("Previous")) {
      int previousItemNumber = (int) session.getAttribute("itemNumber") - 1;
      session.setAttribute("itemNumber", previousItemNumber);
    }

    if (activity.equals("Next") || activity.equals("Previous")) {
      int currentItemNumber = (int) session.getAttribute("itemNumber");
      if (activity.equals("Next")) {
        currentItemNumber--;
      } else {
        currentItemNumber++;
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

    request.getRequestDispatcher("/quiz.jsp").forward(request, response);
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

  }
}
