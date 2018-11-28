package travel.sendMessage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.sendMessage.com.subMailDAO;
import travel.sendMessage.com.subMailDTO;

public class subMailInCommand implements sendMessageCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	
	subMailDTO dto = new subMailDTO();
	subMailDAO dao = subMailDAO.getInstance();
	
	String submail = request.getParameter("Submail");

	dto.setSubmail(submail);

	dao.subinsert(dto); //dao subinsert 구독자 입력함수 실행
	
	//request.getParameter("submail");
	
	}
}
