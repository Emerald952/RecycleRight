

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;


import dao.UserDAO;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		
		UserDAO userDao = new UserDAO();
		String username = userDao.validateUser(email, pwd);
		
		if(username != null) {
			HttpSession session = request.getSession();
			
			session.setAttribute("user", username);
			response.sendRedirect("home.jsp");
		}else {
			response.sendRedirect("home.jsp?LoginError=true");
		}
	}

}
