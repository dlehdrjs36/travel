package travel.airportList.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import travel.member.com.MemberDAO;
import travel.member.com.MemberDTO;

public class AirportListReservationCommand implements AirportListCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		HttpSession session=request.getSession();
		
		String id = (String) session.getAttribute("id");
		String from = request.getParameter("from"); 		//항공 출발위치 
		String to = request.getParameter("to");		//항공 도착위치
		int num = Integer.parseInt(request.getParameter("num"));
		String seat =  request.getParameter("seat");
		String fromdate =  request.getParameter("fromdate");
		String todate =  request.getParameter("todate");
		String dt = request.getParameter("departureTime");	
		String at = request.getParameter("arrivalTime");
		String al = request.getParameter("airLine");
		String ac = request.getParameter("airCode");
		int price = Integer.parseInt(request.getParameter("price"));
		int TotalPrice = num * price; 
		
		String fromName = request.getParameter("fromName");
		String toName = request.getParameter("toName");
		
		String PriceStr = String.format("%,d", price);		
		String TotalPriceStr = String.format("%,d", TotalPrice);
		
		System.out.println(num + " " + seat + " " + fromdate + " " + todate + " " + to + " "+ from);
		
		System.out.println("접속한 ID : "+ id); 
		int check = 0;
		if(id == null) {
			check  = 1;
			System.out.println("로그인 안 했을때 1을 반환 : " + check);
		}else {
			dto = dao.getMemberInfo(id); //이름,이메일,핸드폰 정보를 가져옴
		}
		
		request.setAttribute("dto", dto);	//이름,이메일,핸드폰 정보
		request.setAttribute("num", num);	//성인 카운트		
		request.setAttribute("seat", seat);
		request.setAttribute("fromdate", fromdate);	
		request.setAttribute("todate", todate);	
		request.setAttribute("from", from);	
		request.setAttribute("to", to);			
		////////////////////////////////////////////////////////////////	
		request.setAttribute("dt", dt);		//출발시간
		request.setAttribute("at", at);		//도착시간
		request.setAttribute("al", al);		//항공사 비행기 번호
		request.setAttribute("ac", ac);		//항공사
		request.setAttribute("price", PriceStr+"원");	//가격
		request.setAttribute("TotalPrice", TotalPriceStr+"원");	//전체가격
		request.setAttribute("check", check);	//로그인 여부 확인
		request.setAttribute("fromName", fromName);	//iata 를 뺀 순수 출발 국가명
		request.setAttribute("toName", toName);	//iata 를 뺀 순수 도착 국가명
	}	
}
