package webapp;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Test {

  public String getData() {
    ArrayList<String> data = new ArrayList<>();
    String res = "";
    try {
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz?autoReconnect=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
      Statement stmt = con.createStatement();
      ResultSet rs = stmt.executeQuery("select * from questions");

      while(rs.next()) {
        data.add(rs.getString("answer"));
      }

      for(int i = 0; i < data.size(); i++) {
        res += data.get(i) + ", ";
      }

    } catch (ClassNotFoundException ex) {
      Logger.getLogger(Test.class.getName()).log(Level.SEVERE, null, ex);
    } catch (SQLException ex) {
      Logger.getLogger(Test.class.getName()).log(Level.SEVERE, null, ex);
    }


    return res;
  }
}
