package travel.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import travel.member.command.MemberCommand;
import travel.member.command.MemberFormCommand;
import travel.member.command.MemberIdCheckCommand;


/**
 * Servlet implementation class MemberControll
 */
@WebServlet("*.do")
public class MemberControll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberControll() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberCommand command = null;

		request.setCharacterEncoding("UTF-8");
		String viewPage = null;
		String uri = request.getRequestURI();
		System.out.println(uri);
		String conPath = request.getContextPath();
		System.out.println(conPath);
		String com = uri.substring(conPath.length());
		System.out.println(com);

		/* 회원 관련 */
		// 회원가입 화면으로 이동
		if (com.equals("/MemberJoin.do")) {
			viewPage = "/member/MemberForm.jsp";
		}
		// 회원가입 처리
		else if (com.equals("/MemberForm.do")) {
			command = new MemberFormCommand();
			command.execute(request, response);
			viewPage = "/member/MemberResultForm.jsp";
		}
		else if (com.equals("/MemberIdCheck.do")) {
			command = new MemberIdCheckCommand();
			command.execute(request, response);	
			viewPage = "MemberJoin.do";
		}

		//RequestDispatcher dispatcher = request.getRequestDispatcher( "member/" +viewPage);
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);

	}
}
