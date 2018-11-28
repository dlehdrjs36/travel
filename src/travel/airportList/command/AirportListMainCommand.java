package travel.airportList.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import travel.member.com.MemberDAO;
import travel.member.com.MemberDTO;
import travel.searchview.command.SearchViewDAO;
import travel.searchview.command.SearchViewDTO;

public class AirportListMainCommand implements AirportListCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		MemberDAO memberDao = new MemberDAO();
		MemberDTO memberDto = new MemberDTO();
		
		HttpSession session=request.getSession();
		
		SearchViewDAO dao = new SearchViewDAO();
		SearchViewDTO dto = new SearchViewDTO();
		List<SearchViewDTO> list = new ArrayList<SearchViewDTO>();

		dto.setFromLatitude(request.getParameter("fromLatitude"));
		dto.setFromLongitude(request.getParameter("fromLongitude"));
		dto.setToLatitude(request.getParameter("toLatitude"));
		dto.setToLongitude(request.getParameter("toLongitude"));
		dto.setFromName(request.getParameter("fromName"));
		dto.setToName(request.getParameter("toName"));				
		dto.setFromCountryCode(request.getParameter("fromCountryCode"));		
		dto.setToCountryCode(request.getParameter("toCountryCode"));

		System.out.println("출발지 : " + dto.getFromName()+ ", 도착지 : " + dto.getToName());
		System.out.println("출발지 위도 : " + dto.getFromLatitude()+", 출발지 경도 : " + dto.getFromLongitude());
		System.out.println("도착지 위도 : " + dto.getToLatitude() +", 도착지 경도 : " + dto.getToLongitude());
		System.out.println("출발지 국가 코드"+ dto.getFromCountryCode() + ", 도착지 국가 코드 " + dto.getToCountryCode());		
		
		String id = (String) session.getAttribute("id");		
		String f = request.getParameter("f");
		String t = request.getParameter("t");
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String num = request.getParameter("num");
		String seat =  request.getParameter("seat");
		String fromdate =  request.getParameter("fromdate");
		String todate =  request.getParameter("todate");
		
		System.out.println(f + " " + t + " " + from + " " + to + " "+ num + " "+ seat+ " "+ fromdate+ " " + todate);
		
		System.out.println("접속한 ID : "+ id); 
		int check = 0;
		int check2 = 0;
		if(id == null) {
			check  = 1;
			System.out.println("로그인 안 했을때 1을 반환 : " + check);
		}else {
			memberDto = memberDao.getMemberInfo(id); //이름,이메일,핸드폰 정보를 가져옴
		}
		
		
		dto = dao.getDestinationContents(dto); //제목, 내용 가져옴
		list = dao.getDestinationFileName(dto); //파일 이름을 가져옴

		System.out.println(dto.getContent() + " : " + dto.getTitle());
		
		System.out.println(list.size());
		
		
		if(list.size() == 0) {
			list.add(new SearchViewDTO());
			list.get(0).setFileName("ready.gif");
			//list.get(1).setFileName("ready.gif");
		}
		
		request.setAttribute("memberDto", memberDto);	//이름,이메일,핸드폰 정보
		request.setAttribute("num", num);	//성인 카운트		
		request.setAttribute("seat", seat);
		request.setAttribute("fromdate", fromdate);	
		request.setAttribute("todate", todate);		
		request.setAttribute("from", from);	
		request.setAttribute("to", to);		
		request.setAttribute("f", f);	
		request.setAttribute("t", t);		
		request.setAttribute("check", check);	//로그인 여부 확인
		request.setAttribute("check2", check2+1);
		request.setAttribute("list", list);
		request.setAttribute("dto", dto);
		
	}	
}
