package travel.searchview.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SearchViewCommand {
	void execute(HttpServletRequest request, HttpServletResponse response);
}
