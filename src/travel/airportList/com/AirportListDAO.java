package travel.airportList.com;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import travel.airportList.com.AirportListDTO;


public class AirportListDAO {
	DataSource dataSource;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	AirportListDTO dto = null;
	List<AirportListDTO> dtos = null;

	// 커넥션 풀 사용
	public AirportListDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void InsertReservationInfo(AirportListDTO DTO) throws SQLException {
		try {
			
			String sql = "INSERT INTO reservation(KEY, DEPARTURE, ARRIVAL, DEPARTURE_DATE, DEPARTURE_TIME, ARRIVAL_TIME, FLIGHT_NUMBER, TICKET, SEAT, PRICE, TOTAL_PRICE, AIRLINE, LNAME, FNAME, NATIONALITY, PHONE, EMAIL, ID) "
					+ "VALUES ( reservation_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			conn.setAutoCommit(false);
			pstmt.setString(1, DTO.getDEPARTURE());
			pstmt.setString(2, DTO.getARRIVAL());
			pstmt.setString(3, DTO.getDEPARTURE_DATE());
			pstmt.setString(4, DTO.getDEPARTURE_TIME());
			pstmt.setString(5, DTO.getARRIVAL_TIME());
			pstmt.setString(6, DTO.getFLIGHT_NUMBER());
			pstmt.setInt(7, DTO.getTICKET());
			pstmt.setString(8, DTO.getSEAT());
			pstmt.setString(9, DTO.getPRICE());
			pstmt.setString(10, DTO.getTOTAL_PRICE());
			pstmt.setString(11, DTO.getAIRLINE());
			pstmt.setString(12, DTO.getLNAME());
			pstmt.setString(13, DTO.getFNAME());
			pstmt.setString(14, DTO.getNATIONALITY());
			pstmt.setString(15, DTO.getPHONE());
			pstmt.setString(16, DTO.getEMAIL());
			pstmt.setString(17, DTO.getID());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			conn.rollback();
			e.printStackTrace();
		} finally {
			conn.commit();
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	//관리자가 회원예약정보 확인
	public List<AirportListDTO> SelectReservation() {
		dtos = new ArrayList<AirportListDTO>();
		String sql = "select * from reservation";
		try {
			conn = dataSource.getConnection();
	
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		while (rs.next()) {
		dto = new AirportListDTO();
		dto.setID(rs.getString("ID"));
		dto.setDEPARTURE(rs.getString("DEPARTURE"));
		dto.setARRIVAL(rs.getString("ARRIVAL"));
		dto.setDEPARTURE_DATE(rs.getString("DEPARTURE_DATE"));
		dto.setDEPARTURE_TIME(rs.getString("DEPARTURE_TIME"));
		dto.setARRIVAL_TIME(rs.getString("ARRIVAL_TIME"));
		dto.setFLIGHT_NUMBER(rs.getString("FLIGHT_NUMBER"));
		dto.setTICKET(rs.getInt("TICKET"));
		dto.setSEAT(rs.getString("SEAT"));
		dto.setPRICE(rs.getString("PRICE"));
		dto.setTOTAL_PRICE(rs.getString("TOTAL_PRICE"));
		dto.setAIRLINE(rs.getString("AIRLINE"));
		dto.setLNAME(rs.getString("LNAME"));
		dto.setFNAME(rs.getString("FNAME"));
		dto.setNATIONALITY(rs.getString("NATIONALITY"));
		dto.setPHONE(rs.getString("PHONE"));
		dto.setEMAIL(rs.getString("EMAIL"));
		dto.setRESERVATION_DATE(rs.getDate("RESERVATION_DATE"));
		dtos.add(dto); 
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
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
	//회원 자기자신의 예약정보 확인
	public List<AirportListDTO> SelectMemberReservation(String id) {
		dtos = new ArrayList<AirportListDTO>();
		String sql = "select * from reservation where id = ?";
	try {
		conn = dataSource.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		while (rs.next()) {
		dto = new AirportListDTO();
		dto.setID(rs.getString("ID"));
		dto.setDEPARTURE(rs.getString("DEPARTURE"));
		dto.setARRIVAL(rs.getString("ARRIVAL"));
		dto.setDEPARTURE_DATE(rs.getString("DEPARTURE_DATE"));
		dto.setDEPARTURE_TIME(rs.getString("DEPARTURE_TIME"));
		dto.setARRIVAL_TIME(rs.getString("ARRIVAL_TIME"));
		dto.setFLIGHT_NUMBER(rs.getString("FLIGHT_NUMBER"));
		dto.setTICKET(rs.getInt("TICKET"));
		dto.setSEAT(rs.getString("SEAT"));
		dto.setPRICE(rs.getString("PRICE"));
		dto.setTOTAL_PRICE(rs.getString("TOTAL_PRICE"));
		dto.setAIRLINE(rs.getString("AIRLINE"));
		dto.setLNAME(rs.getString("LNAME"));
		dto.setFNAME(rs.getString("FNAME"));
		dto.setPHONE(rs.getString("PHONE"));
		dto.setEMAIL(rs.getString("EMAIL"));
		dto.setRESERVATION_DATE(rs.getDate("RESERVATION_DATE"));
		dtos.add(dto); 
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
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
	// 예약취소
	public void DeleteReservInfo(String id,Date date,String fn) {
		try {
			String sql = "DELETE FROM reservation WHERE id like ? and reservation_date like ? and flight_number like ?";
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setDate(2, date);
			pstmt.setString(3, fn);
			
			pstmt.executeUpdate();
			
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
		
	}
	
	public void updateRankInfo(String toName) {
		
		try {
			String sql = "UPDATE countryRank " + 
					"SET Rcount = Rcount+1 " + 
					"WHERE countryName= ? ";
			
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, toName);
			System.out.println("==========================");
			pstmt.executeUpdate();
			
			System.out.println(toName + " 조회수 증가");
			
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
	}
	
	public List<AirportListDTO> rankList(){
		List<AirportListDTO> list = new ArrayList<AirportListDTO>();
		
		String sql = "select rownum as rank, countryName, Rcount " +
				"from(select countryName,Rcount from countryRank order by Rcount desc) "+
				"where rownum <=10";
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				dto = new AirportListDTO();
				
				dto.setRankName(rs.getString("countryName"));
				dto.setRank(rs.getString("rank"));
				dto.setRcount(rs.getInt("Rcount"));
				
				list.add(dto);
			}
		
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
		return list;
	}
}