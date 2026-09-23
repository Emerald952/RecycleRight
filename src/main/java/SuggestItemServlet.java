import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import dao.SuggestionDAO;
import model.Suggestion;

@WebServlet("/suggestItem")
public class SuggestItemServlet extends HttpServlet {

	// GET: show the suggest form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect("home.jsp?LoginError=true");
			return;
		}

		request.getRequestDispatcher("suggest.jsp").forward(request, response);
	}

	// POST: handle form submission
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect("home.jsp?LoginError=true");
			return;
		}

		String user = (String) session.getAttribute("user");

		Suggestion s = new Suggestion();
		s.setName(request.getParameter("name"));
		s.setCategory(request.getParameter("category"));
		s.setSubcategory(request.getParameter("subcategory"));
		s.setRecyclable("true".equals(request.getParameter("recyclable")));
		s.setDisposal(request.getParameter("disposal"));
		s.setSubmittedBy(user);

		SuggestionDAO dao = new SuggestionDAO();

		if (dao.addSuggestion(s)) {
			response.sendRedirect("suggest.jsp?status=success");
		} else {
			response.sendRedirect("suggest.jsp?status=error");
		}
	}
}
