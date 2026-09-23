package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.ArrayList;

import util.DBConnection;
import model.DisposalPoint;

public class DisposalDAO{
	public List<DisposalPoint> getAllPoints(){
		List<DisposalPoint> points = new ArrayList<>();
		String query = "SELECT * FROM disposal_centers";
		try(Connection conn = DBConnection.getConnection()){
			PreparedStatement pstmt = conn.prepareStatement(query);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.println("DEBUG: Found row in DB: " + rs.getString("name"));
				points.add(new DisposalPoint(
					rs.getString("name"),
					rs.getString("address"),
					rs.getDouble("latitude"),
					rs.getDouble("longitude"),
					rs.getString("contact"),
					rs.getString("website_url"),
					rs.getString("category")
				));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("DEBUG: Total points list size: " + points.size());
		return points;
	}
}