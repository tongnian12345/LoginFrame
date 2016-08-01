package text;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcConnection {
	
		private static String url="jdbc:mysql://localhost:3306/peter";
		private static String user="root";
		private static String password="12345";
	
		private static Connection conn;
		
		public static Connection getConnection(){
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(url, user, password);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return conn;
		}
}
