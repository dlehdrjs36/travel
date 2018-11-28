package travel.searchview.command;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SearchViewDAO {
	DataSource dataSource;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	List<SearchViewDTO> list = new ArrayList<SearchViewDTO>();
	
	public SearchViewDAO() {

		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public SearchViewDTO getDestinationContents(SearchViewDTO dto) {

		String sql = "select title, content from searchData where countryCode = '" + dto.getToCountryCode() + "'";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}		
		
		return dto;
	}
	
	public List<SearchViewDTO> getDestinationFileName(SearchViewDTO dto){	
		
		String sql = "select imageName from imageList where countryCode = '"+ dto.getToCountryCode() + "'";
		
		int i = 1;
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {	
				dto = new  SearchViewDTO();
				dto.setFileName(rs.getString("imageName"));	
				dto.setCount(i);
				i++;
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}		
		return list;		
	}
	
	public void increaseHits(SearchViewDTO dto) {
		
		String sql = "update searchData set hits = hits+1 where toName = '" + dto.getToName()+"'";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
