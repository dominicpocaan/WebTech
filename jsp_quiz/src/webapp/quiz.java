package webapp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "quiz")
public class quiz extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setAttribute("category", request.getParameter("category"));
    request.setAttribute("type", request.getParameter("type"));
    request.setAttribute("num_items", request.getParameter("num_items"));
    String result = new Test().getData();
    request.setAttribute("data", result);

    request.getRequestDispatcher("/quiz.jsp").forward(request, response);
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

  }
}
