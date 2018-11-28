package travel.sendMessage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface sendMessageCommand {
	void execute(HttpServletRequest request, HttpServletResponse response);
}


