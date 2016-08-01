package text;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class dataServlet extends HttpServlet{
	 
	public static Connection conn;
	public static PreparedStatement ps;
	public static ResultSet rs;
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");  
			response.setCharacterEncoding("UTF-8");
		}
	
	public ArrayList<studentBean> getStudentdata(){
		ArrayList<studentBean> list=new ArrayList<studentBean>();
		 try {
				conn=JdbcConnection.getConnection();
				String sql="select * from student";
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				while(rs.next()){
					studentBean student=new studentBean();
					student.setID(rs.getString("ID"));
					student.setName(rs.getString("name"));
					student.setAge(rs.getInt("age"));
					student.setClassname(rs.getString("classname"));
					student.setSex(rs.getString("sex"));
					student.setNation(rs.getString("nation"));
					student.setPlace(rs.getString("place"));
					list.add(student);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				try {
					conn.close();
					ps.close();
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		return list;
	  }
}
