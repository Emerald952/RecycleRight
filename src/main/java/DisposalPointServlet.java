import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.List;

import dao.DisposalDAO;
import model.DisposalPoint;

@WebServlet("/DisposalPointServlet")
public class DisposalPointServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DisposalDAO dao = new DisposalDAO();
		List<DisposalPoint> points = dao.getAllPoints();
		request.setAttribute("points", points);
		request.getRequestDispatcher("disposalPoint.jsp").forward(request, response);
	}
}
