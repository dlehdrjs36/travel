package travel.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.airportList.command.AirportListCancel2Command;
import travel.airportList.command.AirportListCancelCommand;
import travel.airportList.command.AirportListCommand;
import travel.airportList.command.AirportListMainCommand;
import travel.airportList.command.AirportListManageReservationCommand;
import travel.airportList.command.AirportListMemberReservationCommand;
import travel.airportList.command.AirportListPaymentCommand;
import travel.airportList.command.AirportListReservationCommand;
import travel.airportList.command.AirportListTest;

@WebServlet("*.al")
public class AirportListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public AirportListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String viewPage = null;
		AirportListCommand alc;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		System.out.println(uri);
		System.out.println(conPath);
		System.out.println(com);
			
		if (com.equals("/AirportList.al")) {
			System.out.println("AirportList 호출");			
			alc = new AirportListMainCommand();
			alc.execute(request, response);
			/*viewPage = "/airportList.jsp";*/
			viewPage = "AirportMain.al?contentPage=airportList.jsp";
		}else if (com.equals("/AirportReservation.al")) {
			System.out.println("AirportReservation 호출");			
			alc = new AirportListReservationCommand();
			alc.execute(request, response);
			viewPage = "/View/Reservation.jsp";
			//viewPage = "AirportMain.al?contentPage=/View/Reservation.jsp";
		}else if (com.equals("/AirportPayment.al")) {
			System.out.println("AirportPayment 호출");			
			alc = new AirportListPaymentCommand();
			alc.execute(request, response);
			viewPage = "/View/Payment.jsp";
		}else if (com.equals("/AirportTest.al")) {
			System.out.println("AirportTest 호출");		
			alc = new AirportListTest();
			alc.execute(request, response);
			viewPage = "/airportList.jsp";
		// 관리자 : 회원들의 예약정보 관리
		}else if (com.equals("/AirportManage.al")) {
			System.out.println("AirportManage 호출");		
			alc = new AirportListManageReservationCommand();
			alc.execute(request, response);
			//viewPage = "AirportMain.al?contentPage=/admin/ReservationManage.jsp";
			viewPage = "/admin/ReservationManage.jsp";
		}
		// 회원 : 자기자신의 예약정보 관리
		else if (com.equals("/AirportMemberReserv.al")) {
			System.out.println("AirportMemberReserv 호출");		
			alc = new AirportListMemberReservationCommand();
			alc.execute(request, response);
			//viewPage = "AirportMain.al?contentPage=/admin/ReservationManage.jsp";
			viewPage = "/member/MemberReservation.jsp";
		}
		//관리자 : 예약취소
		else if (com.equals("/AirportCancel.al")) {
			System.out.println("AirportCancel 호출");		
			alc = new AirportListCancelCommand();
			alc.execute(request, response);
			viewPage = "/AirportManage.al";
		}
		//회원: 예약취소
		else if (com.equals("/AirportCancel2.al")) {
			System.out.println("AirportCancel2 호출");		
			alc = new AirportListCancel2Command();
			alc.execute(request, response);
			viewPage = "/AirportMemberReserv.al";
		}

		//공항날씨
		else if (com.equals("/AirportWeather.al")) {
			viewPage = "AirportMain.al?contentPage=airportWeather.jsp";
		}
		//근처의 공항위치
		else if (com.equals("/AirportNear.al")) {
			viewPage = "AirportMain.al?contentPage=airportNear.jsp";
		}
		//항공사 등급
		else if (com.equals("/AirportRank.al")) {
			viewPage = "AirportMain.al?contentPage=airportRank.jsp";
		}
		
		//실시간급상승
		else if (com.equals("/rankInfo.al")) {
			viewPage = "AirportMain.al?contentPage=rankInfo.jsp";
			request.setAttribute("name", request.getParameter("name"));
		}
		
		//메인화면
		else if (com.equals("/AirportMain.al")) {
			System.out.println("AirportMain 호출");		
			viewPage = "main.jsp";
		}
		

		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		
		dispatcher.forward(request, response);	
	}
}
