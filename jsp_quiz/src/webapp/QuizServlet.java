package webapp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "QuizServlet")
public class QuizServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setAttribute("category", request.getParameter("category"));
    request.setAttribute("type", request.getParameter("type"));
    request.setAttribute("num_items", request.getParameter("num_items"));
    ArrayList<Question> questions = null;
    try {
      questions = new Database().getQuestions();
    } catch (SQLException e) {
      e.printStackTrace();
    }

    String id = "";

    for (int i = 0; i < questions.size(); i++) {
      id += questions.get(i).getId() + ", ";
    }

    request.setAttribute("id", id);

    String question = "";

    for (int i = 0; i < questions.size(); i++) {
      question += questions.get(i).getQuestion() + ", ";
    }

    request.setAttribute("question", question);

    String answer = "";

    for (int i = 0; i < questions.size(); i++) {
      answer += questions.get(i).getAnswer() + ", ";
    }

    request.setAttribute("answer", answer);

    request.getRequestDispatcher("/quiz.jsp").forward(request, response);
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

  }
}
