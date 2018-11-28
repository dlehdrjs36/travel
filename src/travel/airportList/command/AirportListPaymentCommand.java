package travel.airportList.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import travel.airportList.com.AirportListDAO;
import travel.airportList.com.AirportListDTO;

public class AirportListPaymentCommand implements AirportListCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub	
		
		HttpSession session=request.getSession();
		String id = (String) session.getAttribute("id");
		
		AirportListDAO dao = new AirportListDAO();
		AirportListDTO dto = new AirportListDTO();
		
		dto.setID(id);
		dto.setLNAME(request.getParameter("성"));
		dto.setFNAME(request.getParameter("이름"));
		dto.setNATIONALITY(request.getParameter("contury"));
		dto.setPHONE(request.getParameter("휴대전화"));
		dto.setEMAIL(request.getParameter("이메일"));
		dto.setADDRESS(request.getParameter("구매자주소"));
		dto.setDEPARTURE(request.getParameter("출발지"));
		dto.setARRIVAL(request.getParameter("도착지"));
		dto.setDEPARTURE_DATE(request.getParameter("출발날짜"));
		dto.setFLIGHT_NUMBER(request.getParameter("비행기번호"));
		dto.setTICKET(Integer.parseInt(request.getParameter("구매한표개수")));
		dto.setSEAT(request.getParameter("좌석유형"));
		dto.setPRICE(request.getParameter("구매표개당가격"));
		dto.setTOTAL_PRICE(request.getParameter("총가격"));
		dto.setAIRLINE(request.getParameter("항공사이름"));
		dto.setDEPARTURE_TIME(request.getParameter("출발시간"));
		dto.setARRIVAL_TIME(request.getParameter("도착시간"));
		
		
		String fromName = request.getParameter("fromName");
		String toName = request.getParameter("toName");
		
		System.out.println(toName);
		dao.updateRankInfo(toName);		
		try {
			dao.InsertReservationInfo(dto);
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		request.setAttribute("dto", dto);
		/*String lname = request.getParameter("성");
		String fname = request.getParameter("이름");
		String national = request.getParameter("nationality");
		String phone = request.getParameter("휴대전화");
		String email = request.getParameter("이메일");
		String dep = request.getParameter("출발지");
		String arr = request.getParameter("도착지");
		String ddate = request.getParameter("출발날짜");
		String airnum = request.getParameter("비행기번호");
		String ticket = request.getParameter("구매한표개수");
		String seat = request.getParameter("좌석유형");
		String price = request.getParameter("구매표개당가격");
		String totalprice = request.getParameter("총가격");
		String airline = request.getParameter("항공사이름");
		String dtime = request.getParameter("출발시간");
		String atime = request.getParameter("도착시간");
		*/		
	}
}
