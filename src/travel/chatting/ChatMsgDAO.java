package travel.chatting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ChatMsgDAO {
	DataSource dataSource;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ChatMsgDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<String> getInitMsg(String d) {
		List<String> list = new ArrayList<>();
		String sql = "select chat_msg, create_date from chatting_temp where create_date > to_date(?,'rrrr/mm/dd hh24:mi:ss') order by 2";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, d);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(rs.getString("chat_msg"));
			}
		} catch (SQLException e) {
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
		return list;

	}

	public /* List<String> */ void getMsg() {
		List<String> list = new ArrayList<>();
		String sql = "select ses_id, chat_msg from chatting_temp order by 1";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(rs.getString("chat_msg"));
			}
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
		// return list;
	}// end of getMsg

	public void insertMsg(String message, String id) {

		System.out.println(id + "/ " + message);

		String sql = "insert into chatting_temp values((select max(nvl(ses_id,0))+1 from chatting_temp),?,?,sysdate)";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, message);
			int r = pstmt.executeUpdate();
			System.out.println(r + " 건이 입력되었습니다.");
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
	}// end of insertMsg
}// end of class
