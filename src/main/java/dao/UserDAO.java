package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.DBConnection;
import org.mindrot.jbcrypt.BCrypt;

public class UserDAO{
	public boolean isUserExists(String username, String email) {
		String query = "SELECT 1 FROM users WHERE username = ? OR email = ?";
		
		try(Connection conn = DBConnection.getConnection()){
			
			PreparedStatement pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1,  username);
			pstmt.setString(2, email);
			
			try(ResultSet rs = pstmt.executeQuery()){
				return rs.next();
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean registerUser(String username, String email, String password) {
		String hashPwd = BCrypt.hashpw(password, BCrypt.gensalt());
		
		String query = "INSERT INTO users(username, email, password) VALUES (?, ?, ?)";
		
		try(Connection conn = DBConnection.getConnection()){
			PreparedStatement pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, username);
			pstmt.setString(2, email);
			pstmt.setString(3, hashPwd);
			
			return pstmt.executeUpdate() > 0;
			
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public String validateUser(String email, String password) {
		String sql = "SELECT username, password FROM users WHERE email = ?";
		try(Connection conn = DBConnection.getConnection()){
				PreparedStatement pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, email);
				
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()) {
					String dbHash = rs.getString("password");
					String dbName = rs.getString("username");
					
					if(BCrypt.checkpw(password, dbHash)){
						return dbName;
					}
					
				}
				
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}

