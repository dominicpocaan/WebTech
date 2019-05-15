package webapp;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Created by: Dominic Pocaan
 * Class for creating database object and
 * other methods for querying database.
 */
public class Database {
  Connection connection;

  /**
   * Created by: Dominic Pocaan
   * Create a new database connection.
   * @return New database connection.
   */
  public Connection getConnection() {
    try {
      Class.forName("com.mysql.jdbc.Driver");
      connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz?autoReconnect=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
    } catch (ClassNotFoundException ex) {
      Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
    } catch (SQLException ex) {
      Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
    }
    return connection;
  }

  /**
   * Created by: Dominic Pocaan
   * Query all question from the current
   * database connection.
   * @param num_items Cumber of question to be queried.
   * @param category Category of question.
   * @return ArrayList of object Question.
   * @throws SQLException
   */
  public ArrayList<Question> getQuestions(int num_items, int category) throws SQLException {
    ArrayList<Question> questionsQueried = new ArrayList<>();
    ArrayList<Question> questionsFinal   = new ArrayList<>();

    Database db = new Database();
    Connection con = db.getConnection();

    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM fillintheblanks");

    while(rs.next()) {
      Question question = new Question(rs.getInt("id"), rs.getInt("category"), rs.getString("question"), rs.getString("correctAnswer"), null, false);
      questionsQueried.add(question);
    }

    for (int i = 0; i < questionsQueried.size(); i++) {
      if (questionsQueried.get(i).getCategory() == category) {
        questionsFinal.add(questionsQueried.get(i));
      }

      if (questionsFinal.size() == num_items) {
        break;
      }
    }

    return questionsFinal;
  }
}
