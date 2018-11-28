package travel.member.com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	DataSource dataSource;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	MemberDTO dto = null;
	List<MemberDTO> dtos = null;

	// 커넥션 풀 사용
	public MemberDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int InsertMember(MemberDTO MB) {
		int check = 0;
		try {
			String sql = "INSERT INTO member(ID,PW,PHONE,ADDRESS,GENDER,NAME,EMAIL) VALUES ( ?, ? , ? , ? , ? , ?, ?)";
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, MB.getId());
			pstmt.setString(2, MB.getPw());
			pstmt.setString(3, MB.getPhone());
			pstmt.setString(4, MB.getAddress());
			pstmt.setInt(5, MB.getGender());
			pstmt.setString(6, MB.getName());
			pstmt.setString(7, MB.getEmail());

			check = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return check;
	}

	public int SelectMemberCheck(MemberDTO MB) {
		int check = 0;
		try {
			String sql = "SELECT count(*) FROM member WHERE id = ?";

			conn = dataSource.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, MB.getId());

			rs = pstmt.executeQuery();

			if (rs.next())
				check = rs.getInt("count(*)");
			System.out.println(check);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
		return check;
	}
	
	
	public int getMember(String id) {
		
		int check =0;
		
		try {
			conn = dataSource.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String sql = "select count(*) from member where id = ?";
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				check = rs.getInt("count(*)"); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {			
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {

				e2.printStackTrace();
			}
		}		
		return check;	
	}

	public int userCheck(String id, String pw) {
		int ri = 0;
		String dbpw;
		
		try {
			conn = dataSource.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	
		String sql = "SELECT pw FROM member WHERE id = ?";
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
	
			if(rs.next()) {
				dbpw = rs.getString("pw");
				if(dbpw.equals(pw)) {
					ri = 1;
				} else {
					ri = 0;
				}
			} else {
				ri = -1;
			}
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	public MemberDTO getMemberInfo(String id){
		
		String sql = "SELECT name, email, phone,address FROM member WHERE id = ?";
		
		try {			

			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dto = new MemberDTO();
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));		
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}		

		return dto;		
	}
}
