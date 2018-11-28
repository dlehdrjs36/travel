package travel.sendMessage.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.sendMessage.com.sendMessageDAO;
import travel.sendMessage.com.sendMessageDTO;

public class sendMessageViewCommand implements sendMessageCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		 
		sendMessageDAO dao =  sendMessageDAO.getInstance();
		
		ArrayList<sendMessageDTO> dtos = null;
		
		dtos = dao.SelectsendMessage();
	
		request.setAttribute("inquiryList", dtos);
	}
}
