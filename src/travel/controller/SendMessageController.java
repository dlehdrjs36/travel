package travel.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.sendMessage.command.sendMessageCommand;
import travel.sendMessage.command.sendMessageInCommand;
import travel.sendMessage.command.sendMessageViewCommand;
import travel.sendMessage.command.subMailInCommand;


@WebServlet("*.jhw")
public class SendMessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	   
    public SendMessageController() {
        super();
    
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		actionDo(req,res);
	
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		actionDo(req,res);
		
	}

	protected void actionDo(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String viewPage = null;
		sendMessageCommand smc = null;
		
		String uri = req.getRequestURI();
		String conPath = req.getContextPath();
		String com = uri.substring(conPath.length());
		
		
		if(com.equals("/insert.jhw")) {
			smc = new sendMessageInCommand();
			smc.execute(req, res);
			viewPage = "/AirportMain.al";			
		}
		
		else if(com.equals("/submail.jhw")) {
			smc = new subMailInCommand();
			smc.execute(req, res);
			viewPage = "/AirportMain.al";	
		}
		//메시지
		else if(com.equals("/MemberMessage.jhw")) {
			smc = new sendMessageViewCommand(); 
			smc.execute(req, res);
			viewPage = "/admin/inquiry.jsp";	
		}	
			
		RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
		
		dispatcher.forward(req, res);	
	}
}
