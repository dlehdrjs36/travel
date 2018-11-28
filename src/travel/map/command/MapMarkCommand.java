package travel.map.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MapMarkCommand implements MapCommand{
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String latt = request.getParameter("latt");
		String lngg = request.getParameter("lngg");
		String latt2 = request.getParameter("latt2");
		String lngg2 = request.getParameter("lngg2");		
	
		
		request.setAttribute("from", from);
		request.setAttribute("to", to);
		request.setAttribute("latt", latt);
		request.setAttribute("lngg", lngg);
		request.setAttribute("latt2", latt2);
		request.setAttribute("lngg2", lngg2);
	}
}
