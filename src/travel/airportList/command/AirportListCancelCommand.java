package travel.airportList.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.airportList.com.AirportListDAO;

public class AirportListCancelCommand implements AirportListCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
				
		String id = request.getParameter("id"); 		//회원id
		String date = request.getParameter("date"); 		//날짜
		String fn = request.getParameter("fn"); 		//비행기번호
		
		Date todate = Date.valueOf(date);
		System.out.println(id);
		System.out.println(todate);
		AirportListDAO dao = new AirportListDAO();
		
		dao.DeleteReservInfo(id,todate,fn);
		
		
	}

}
