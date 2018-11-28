package travel.airportList.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.airportList.com.AirportListDAO;
import travel.airportList.com.AirportListDTO;

public class AirportListManageReservationCommand implements AirportListCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		AirportListDAO dao = new AirportListDAO();
		List<AirportListDTO> dtos = null;
		
		dtos = dao.SelectReservation();	
		
		request.setAttribute("ReservationList", dtos);	//예약정보

	}	
}


