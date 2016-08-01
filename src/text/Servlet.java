package text;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Servlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private String[] student1={"peter","25","2"};
	private String[] student2={"lilei","22","1"};
	private String[] student3={"alex","26","2"};
	private String[] student4={"leo","22","3"};
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
			if (username.equals(student1[0])) {
				response.sendRedirect(request.getContextPath()+"/JSP/searchInfo.jsp?name="+student1[0]+"&age="+student1[1]+"&classname="+student1[2]);
				return;
			} else if(username.equals(student2[0])){
				response.sendRedirect(request.getContextPath()+"/JSP/searchInfo.jsp?name="+student2[0]+"&age="+student2[1]+"&classname="+student2[2]);
				return;
			}
			else if (username.equals(student3[0])) {
				response.sendRedirect(request.getContextPath()+"/JSP/searchInfo.jsp?name="+student3[0]+"&age="+student3[1]+"&classname="+student3[2]);
				return;
			}
			else if (username.equals(student4[0])) {
				response.sendRedirect(request.getContextPath()+"/JSP/searchInfo.jsp?name="+student4[0]+"&age="+student4[1]+"&classname="+student4[2]);
				return;
			}
			else{
				response.sendRedirect(request.getContextPath()+"/html/searchFail.html");	
			}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}







