package travel.daat.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface DaatCommand {
	void execute(HttpServletRequest request, HttpServletResponse response);
}

