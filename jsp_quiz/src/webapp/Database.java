package webapp;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Database {
  Connection connection;

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

  public ArrayList<Question> getQuestions(int num_items) throws SQLException {
    ArrayList<Question> questionsQueried = new ArrayList<>();
    ArrayList<Question> questionsFinal   = new ArrayList<>();

    Database db = new Database();
    Connection con = db.getConnection();

    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM fillintheblanks");

    while(rs.next()) {
      Question question = new Question(rs.getInt("id"), rs.getInt("category"), rs.getString("question"), rs.getString("correctAnswer"), null);
      questionsQueried.add(question);
    }

    for (int i = 0; i < num_items; i++) {
      questionsFinal.add(questionsQueried.get(i));
    }

    return questionsFinal;
  }
}
