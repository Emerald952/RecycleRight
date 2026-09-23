package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBConnection;
import model.Suggestion;

public class SuggestionDAO {

	// Insert a new suggestion with PENDING status
	public boolean addSuggestion(Suggestion s) {
		String sql = "INSERT INTO suggestions(name, category, subcategory, recyclable, disposal, submitted_by) VALUES (?, ?, ?, ?, ?, ?)";

		try (Connection conn = DBConnection.getConnection()) {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s.getName());
			pstmt.setString(2, s.getCategory());
			pstmt.setString(3, s.getSubcategory());
			pstmt.setBoolean(4, s.isRecyclable());
			pstmt.setString(5, s.getDisposal());
			pstmt.setString(6, s.getSubmittedBy());

			return pstmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	// Get all PENDING suggestions (for admin)
	public List<Suggestion> getPendingSuggestions() {
		List<Suggestion> list = new ArrayList<>();
		String sql = "SELECT * FROM suggestions WHERE status = 'PENDING' ORDER BY id ASC";

		try (Connection conn = DBConnection.getConnection()) {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Suggestion s = new Suggestion();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setCategory(rs.getString("category"));
				s.setSubcategory(rs.getString("subcategory"));
				s.setRecyclable(rs.getBoolean("recyclable"));
				s.setDisposal(rs.getString("disposal"));
				s.setSubmittedBy(rs.getString("submitted_by"));
				s.setStatus(rs.getString("status"));
				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// Approve: copy to waste_items + mark APPROVED
	public boolean approveSuggestion(int id) {
		String insertSql = "INSERT INTO waste_items(name, category, subcategory, recyclable, disposal) " +
				"SELECT name, category, subcategory, recyclable, disposal FROM suggestions WHERE id = ?";
		String updateSql = "UPDATE suggestions SET status = 'APPROVED' WHERE id = ?";

		try (Connection conn = DBConnection.getConnection()) {
			conn.setAutoCommit(false);

			PreparedStatement insertStmt = conn.prepareStatement(insertSql);
			insertStmt.setInt(1, id);
			insertStmt.executeUpdate();

			PreparedStatement updateStmt = conn.prepareStatement(updateSql);
			updateStmt.setInt(1, id);
			updateStmt.executeUpdate();

			conn.commit();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	// Reject: just mark REJECTED
	public boolean rejectSuggestion(int id) {
		String sql = "UPDATE suggestions SET status = 'REJECTED' WHERE id = ?";

		try (Connection conn = DBConnection.getConnection()) {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			return pstmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}
