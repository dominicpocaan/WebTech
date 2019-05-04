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

  public ArrayList<Question> getQuestions() throws SQLException {
    ArrayList<Question> questions = new ArrayList<>();

    Database db = new Database();
    Connection con = db.getConnection();

    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from questions");

    while(rs.next()) {
      Question question = new Question(rs.getInt("id"), rs.getString("question"), rs.getString("answer"));
      questions.add(question);
    }

    return questions;
  }
}
