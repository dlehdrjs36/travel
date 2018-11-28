package travel.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.member.com.MemberDAO;
import travel.member.com.MemberDTO;


public class MemberFormCommand implements MemberCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int check;
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		String name = request.getParameter("name");
		int gender = Integer.parseInt(request.getParameter("gender"));
		String phone = request.getParameter("phone1") +"-"+request.getParameter("phone2") +"-"+ request.getParameter("phone3");	
		String addr = request.getParameter("postcode")+"-"+request.getParameter("roadAddress")+"-"+request.getParameter("jibunAddress");	
		String email = request.getParameter("email");		
		//String guide = request.getParameter("guide");

		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPw(pw);
		dto.setName(name);
		dto.setGender(gender);
		dto.setPhone(phone);
		dto.setAddress(addr);
		dto.setEmail(email);
		
		check = dao.InsertMember(dto);
		//가입완료시 1 반환
		request.setAttribute("check", check);
		
	}

}
