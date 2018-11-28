package travel.sendMessage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.sendMessage.com.sendMessageDAO;
import travel.sendMessage.com.sendMessageDTO;

public class sendMessageInCommand implements sendMessageCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		sendMessageDTO dto = new sendMessageDTO();
		sendMessageDAO dao =  sendMessageDAO.getInstance();
		
		String name = request.getParameter("Name");
		String email = request.getParameter("Email");
		String mess = request.getParameter("Message");
		
		dto.setName(name);
		dto.setEmail(email);
		dto.setMessage(mess);

		dao.insertInfo(dto);
		
	}
}
