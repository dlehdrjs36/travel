package travel.image.com;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class ImageListDAO {

	DataSource dataSource;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	ImageListDTO dto;

	public ImageListDAO() {

		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
	
	public void ImageInsert(ImageListDTO dto) {

		try {			
			String sql = "insert into image values(image_seq.nextval,?,?,?,?,?,?)";
			
			conn = dataSource.getConnection();			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getThumnail());
			pstmt.setString(4, dto.getDetail());
			pstmt.setString(5, dto.getPrice());
			pstmt.setString(6, dto.getHits());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	}
	
	public int ImageListTotalCount() {	
		
		int count = 0;		

		String sql2 = "select count(*) as count from image";

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			rs.next();
			count=rs.getInt("count");

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
		return count;
	}
	
	public List<ImageListDTO> imageList(int count) {

		List<ImageListDTO> list = new ArrayList<ImageListDTO>();
		
		ImageListDTO dto = null;

		int totalCount = count;

		int page1;

		page1 = count/6;
		
		if(page1 == 0)
			page1 = 1;

		int countPage = 6;

		int query_startPage = (page1 - 1) * countPage + 1;
		int query_endPage = page1 * countPage; 

		try {

			String sql = "select X.rnum, X.key, X.title, X.content, X.thumnail, X.detail, X.price,X.hits from ( "

						 +"select rownum as rnum, A.key, A.title, A.content, A.thumnail, A.detail, A.price, A.hits "

						 +"from ( "

						 +"select key, title, content, thumnail,detail,price,hits "

						 +"from image " 

						 +"order by key desc) A " 

						 +"where rownum <= "+query_endPage+") X " 

						 +"where X.rnum >= "+query_startPage+"";
			
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();

			while(rs.next()) {
				dto = new ImageListDTO();
				dto.setContent(rs.getString("content"));
				dto.setDetail(rs.getString("detail"));
				dto.setHits(rs.getString("hits"));
				dto.setKey(rs.getString("key"));
				dto.setPrice(rs.getString("price"));
				dto.setThumnail(rs.getString("thumnail"));
				dto.setTitle(rs.getString("title"));			
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
}
