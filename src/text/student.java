package text;

import java.io.IOException;
import java.nio.channels.ScatteringByteChannel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.classfile.StackMapType;
import com.sun.xml.internal.ws.developer.StreamingAttachment;


public class student extends HttpServlet {

	public static Connection conn;
	public static PreparedStatement ps;
	public static int count;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			List<studentBean> student=(List<studentBean>)new dataServlet().getStudentdata();
			String type=request.getParameter("types");
			String stuId=request.getParameter("stuId");
			response.setCharacterEncoding("utf-8");
			if("save".equals(type)){		//表示执行的是修改保存操作
				for(int i=0;i<student.size();i++){
						if(student.get(i).getID().equals(stuId)){
						String name=request.getParameter("name"+stuId);
						int age=Integer.parseInt(request.getParameter("age"+stuId));
						String classname=request.getParameter("classname"+stuId);
						String sex=request.getParameter("sex"+stuId);
						String nation=request.getParameter("nation"+stuId);
						String place=request.getParameter("place"+stuId);
						try {
							conn=JdbcConnection.getConnection();
							String sql1="update student set name=?,age=?,classname"
									                 + "=?,sex=?,nation=?,place=? where ID=?";
							ps=conn.prepareStatement(sql1);
							ps.setString(1, name);
							ps.setInt(2, age);
							ps.setString(3, classname);
							ps.setString(4, sex);
							ps.setString(5, nation);
							ps.setString(6, place);
							ps.setString(7, stuId);
							count=ps.executeUpdate();
						} catch (Exception e) {
							e.printStackTrace();
						}finally{
							try {
								conn.close();
								ps.close();
							} catch (SQLException e) {
								e.printStackTrace();
							}
						}
					}
				}
			}else{		//执行删除操作
				try {
					conn=JdbcConnection.getConnection();
					String sql2="delete from student where ID=?";
					ps=conn.prepareStatement(sql2);
					ps.setString(1, stuId);
					count=ps.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}finally{
					try {
						if(conn!=null){
							conn.close();
						}
						if(ps!=null){
							ps.close();
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			request.getRequestDispatcher("JSP/studentinfo.jsp").forward(request, response);
	}
}
