package travel.airportList.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import travel.airportList.com.AirportListDAO;
import travel.airportList.com.AirportListDTO;

public class AirportListMemberReservationCommand implements AirportListCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String id = (String) session.getAttribute("id");	
		
		AirportListDAO dao = new AirportListDAO();
		List<AirportListDTO> dtos = null;
		
		dtos = dao.SelectMemberReservation(id);	
		
		request.setAttribute("ReservationList", dtos);	//예약정보

	}

}
