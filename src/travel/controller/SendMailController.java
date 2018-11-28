package travel.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.sendEmail.SendMailDAO;

/**
 * Servlet implementation class SendMailTest
 */
@WebServlet("/SendMail")
public class SendMailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SendMailController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("=======================");
		String action = request.getParameter("action");
		SendMailDAO dao = new SendMailDAO();

		if (action.equals("sendMail")) {
			List<String> list = dao.getMailList();
			String contents = request.getParameter("contents");
			dao.sendMail(list, contents);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
