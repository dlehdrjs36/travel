package travel.daat.com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DaatDAO {
	
	DataSource dataSource;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	DaatDTO dto;

	public DaatDAO() {

		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

}
