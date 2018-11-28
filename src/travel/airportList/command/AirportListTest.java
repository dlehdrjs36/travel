package travel.airportList.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import travel.member.com.MemberDAO;
import travel.member.com.MemberDTO;

public class AirportListTest implements AirportListCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		HttpSession session=request.getSession();	
		
		/*String from = request.getParameter("from");*/
		System.out.println("AirportListTest 안");
		session.setAttribute("f", request.getParameter("f"));
		session.setAttribute("t", request.getParameter("t"));
		System.out.println((String)session.getAttribute("f"));
		System.out.println((String)session.getAttribute("t"));
		session.setAttribute("from", request.getParameter("from"));
		session.setAttribute("to", request.getParameter("to"));
		session.setAttribute("fromdate", request.getParameter("fromdate"));

		
/*		System.out.println(session.getAttribute("from"));
		System.out.println(session.getAttribute("to"));
		System.out.println(session.getAttribute("fromdate"));
		System.out.println(session.getAttribute("id"));	*/	

	}	
}
