package travel.sendMessage.com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import travel.sendMessage.com.sendMessageDTO;

public class sendMessageDAO {
	
	private static sendMessageDAO instance = new sendMessageDAO();
	
	private sendMessageDAO() {
		
	}	
	
	public static sendMessageDAO getInstance() {
		return instance;
	}

	private Connection getConnection() {
	
		Context context = null;
		DataSource dataSource = null;
		Connection connection = null;
		try {
			context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			connection = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return connection;
	}


//	문의 정보 입력 (insert 부분)
	public int insertInfo(sendMessageDTO dto) {
		int ri = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO contact_information VALUES (?,?,?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getMessage());
	
			ri = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
// 문의정보 보기
	public ArrayList<sendMessageDTO> SelectsendMessage() {
		ArrayList<sendMessageDTO> dtos = new ArrayList<sendMessageDTO>();
		sendMessageDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from contact_information";
	
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
			 dto = new sendMessageDTO();
			 dto.setName(rs.getString("NAME"));
			 dto.setEmail(rs.getString("MAIL"));
			 dto.setMessage(rs.getString("MESSAGE"));
			 dtos.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dtos;	
	}
}
