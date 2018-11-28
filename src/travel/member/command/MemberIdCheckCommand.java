package travel.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.member.com.MemberDAO;
import travel.member.com.MemberDTO;

public class MemberIdCheckCommand implements MemberCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		int check;
		//히든으로 넘기는 값
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String passwordcheck = request.getParameter("passwordcheck");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String email = request.getParameter("email");
		String postcode = request.getParameter("postcode");
		String roadAddress = request.getParameter("roadAddress");
		String jibunAddress = request.getParameter("jibunAddress");
				
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		//ID중복 체크값
		check = dao.SelectMemberCheck(dto);
		//히든값
		request.setAttribute("id", id);
		request.setAttribute("password", password);
		request.setAttribute("passwordcheck", passwordcheck);
		request.setAttribute("name", name);
		request.setAttribute("gender", gender);
		request.setAttribute("phone1", phone1);
		request.setAttribute("phone2", phone2);
		request.setAttribute("phone3", phone3);
		request.setAttribute("email", email);
		request.setAttribute("postcode", postcode);
		request.setAttribute("roadAddress", roadAddress);
		request.setAttribute("jibunAddress", jibunAddress);
		request.setAttribute("check", check);	
	}
}
