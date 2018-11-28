package travel.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.daat.command.DaatCommand;
import travel.daat.command.DepartureCommand;

@WebServlet("*.daat")
public class DaatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	   
    public DaatController() {
        super();    
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(req,res);
	
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(req,res);
		
	}

	protected void actionDo(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
/*		res.setContentType("text/xml charset-utf-8");
		res.setCharacterEncoding("utf-8"); json에서 보낼때 글자 깨짐 방지*/
		

		String viewPage = null;
		DaatCommand dc = null;
		
		String uri = req.getRequestURI();
		String conPath = req.getContextPath();
		String com = uri.substring(conPath.length());
		
		if (com.equals("/Departure.daat")) {
			System.out.println("Departure호출");
			dc = new DepartureCommand();
			dc.execute(req, res);
			viewPage = "/Departuretest.jsp";
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
		
		dispatcher.forward(req, res);	
	}
}
