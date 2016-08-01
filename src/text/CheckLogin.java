package text;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckLogin extends HttpServlet{

	private boolean f1;
	private static Connection conn;
	private static PreparedStatement ps;
	private static ResultSet rs;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置页面的编码方式
  		request.setCharacterEncoding("UTF-8");
		//获得参数
  		String username=request.getParameter("username");
   		String password=request.getParameter("password");
  		 if(username!=null){
  			f1=checklogin(username, password);
  	   		if(f1==true){
  	   			request.getRequestDispatcher("JSP/loginFrame.jsp").forward(request, response);
  	   		}else{
  	   			request.getRequestDispatcher("JSP/loginFail.jsp").forward(request, response);
  	   		}
 	} else{
 				request.getRequestDispatcher("JSP/login.jsp").forward(request, response);
 		} 
	}
	
	public  boolean checklogin(String username,String password){
		boolean f2=false;
		try {
			conn=JdbcConnection.getConnection();
			String sql="select * from user where username='"+username+"' and password= '"+password+"'";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()){
				f2=true;
			}else{
				return f2;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f2;
	}
}

