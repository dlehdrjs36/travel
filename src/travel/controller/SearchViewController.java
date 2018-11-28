package travel.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.searchview.command.SearchViewCommand;
import travel.searchview.command.SearchViewMainCommand;

@WebServlet("*.sv")
public class SearchViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	   
    public SearchViewController() {
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
		
		String viewPage = null;
		SearchViewCommand svc = null;
		
		String uri = req.getRequestURI();
		String conPath = req.getContextPath();
		String com = uri.substring(conPath.length());
				
		
		if(com.equals("/searchResultView.sv")) {
			svc = new SearchViewMainCommand();
			System.out.println("searchResultView 호출");
			svc.execute(req, res);
			viewPage = "searchResultView/searchView.jsp";
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);		
		dispatcher.forward(req, res);	
	}
}

