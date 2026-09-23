import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import dao.SuggestionDAO;
import model.Suggestion;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

	// GET: show pending suggestions
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		if (session == null || !"admin".equals(session.getAttribute("role"))) {
			response.sendRedirect("home.jsp");
			return;
		}

		SuggestionDAO dao = new SuggestionDAO();
		List<Suggestion> pendingList = dao.getPendingSuggestions();
		request.setAttribute("pendingList", pendingList);
		request.getRequestDispatcher("admin.jsp").forward(request, response);
	}

	// POST: handle approve or reject
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		if (session == null || !"admin".equals(session.getAttribute("role"))) {
			response.sendRedirect("home.jsp");
			return;
		}

		String action = request.getParameter("action");
		int id = Integer.parseInt(request.getParameter("id"));

		SuggestionDAO dao = new SuggestionDAO();

		if ("approve".equals(action)) {
			dao.approveSuggestion(id);
		} else if ("reject".equals(action)) {
			dao.rejectSuggestion(id);
		}

		response.sendRedirect("admin");
	}
}
