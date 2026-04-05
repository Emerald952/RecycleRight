
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import dao.UserDAO;


/**
 * Servlet implementation class signup
 */
@WebServlet("/signup")
public class signup extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		String  user = request.getParameter("username");
		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		
		UserDAO  userDao = new UserDAO();
		
		if(userDao.isUserExists(user, email)) {
			response.sendRedirect("home.jsp?SignupError=taken");
		}
		else {
			if(userDao.registerUser(user, email, pwd)) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				response.sendRedirect("home.jsp?status=success");
			}
			else {
				request.setAttribute("error", "Database Error. Please try again.");
				request.getRequestDispatcher("home.jsp").forward(request, response);
			}
		}
	}

}
