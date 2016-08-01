package text;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ModifyPassword extends HttpServlet {
	
		private static final long serialVersionUID = 1L;
		
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doPost(req, resp);
		}
		
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String usedPassword=request.getParameter("usedPassword");
			String newPassword=request.getParameter("newPassword");
			String confirmPassword=request.getParameter("confirmPassword");
			ServletContext application=this.getServletContext();
			if(usedPassword.equals(application.getAttribute("password"))){
				if(newPassword.equals(confirmPassword)){
					application.setAttribute("password", newPassword);
					response.sendRedirect("html/modifyPasswordSuccess.html");
				}else{
					response.sendRedirect("html/modifyPasswordFail.html");
				}
			}
		}
}
