package travel.image.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ImageListCommand {
	void execute(HttpServletRequest request, HttpServletResponse response);
}
