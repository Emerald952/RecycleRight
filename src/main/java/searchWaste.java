import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.HashSet;
import java.util.Set;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import util.DBConnection;
import model.WasteItem;

/**
 * Servlet implementation class searchWaste
 */
@WebServlet("/searchWaste")
public class searchWaste extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String waste = request.getParameter("waste");
		String category = request.getParameter("category");
		String viewAll = request.getParameter("all");
		
		List<WasteItem> wasteList = new ArrayList<>();
		String query = "";
		String heading="";
		boolean isCategorySearch = false;
		Set<String> subCategories = new HashSet<>();
		
		try(Connection conn = DBConnection.getConnection()){
			if(conn != null) {
				PreparedStatement  pstmt;
				if(viewAll != null) {
					query = "SELECT * FROM waste_items ORDER BY name ASC";
					heading = "Waste Items";
					pstmt= conn.prepareStatement(query);
				}
				else if(category != null && !category.isEmpty()) {
					query = "SELECT * FROM waste_items WHERE category ILIKE ?";
					heading += category + " Waste"; 
					isCategorySearch = true;
					pstmt= conn.prepareStatement(query);
					pstmt.setString(1, category);	
				}
				else {
					query = "SELECT * FROM waste_items WHERE name ILIKE ?";
					heading += "Search result for: '" + waste + "'"; 
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1,waste + "%");
				}
				
				
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					WasteItem item = new WasteItem();
					item.setName(rs.getString("name"));
	                item.setCategory(rs.getString("category"));
	                item.setSubcategory(rs.getString("subcategory"));
	                item.setRecyclable(rs.getBoolean("recyclable"));
	                item.setDisposal(rs.getString("disposal"));
	                
	                wasteList.add(item);
	                
	                if(category!=null && !category.isEmpty()) {
	                	subCategories.add(rs.getString("subcategory"));
	                }
				}
				
				request.setAttribute("resultsSubcat", subCategories);
				request.setAttribute("isCategorySearch", isCategorySearch);
				request.setAttribute("resultsHeading", heading);
				request.setAttribute("results", wasteList);
				request.getRequestDispatcher("result.jsp").forward(request, response);
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
			response.getWriter().println("Error connecting to database.");
				
		}	
	}
}
