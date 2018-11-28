package travel.airportList.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AirportListCommand {
	void execute(HttpServletRequest request, HttpServletResponse response);
}


