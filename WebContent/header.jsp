<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/airport.css" /> --%>
<style>
/* .btn00 { /* 상단 bar 투명도와 마우스 hover시 투명도 1설정 */
	opacity: 0.7;
}
.btn00:hover {
	opacity: 1;
	background-color: /* black; */
} */
</style>
</head>
<div class="w3-bar w3-white w3-border-bottom w3-xlarge btn00" style="height: 5%; position: fixed; z-index:4;">
	<a href="AirportMain.al" class="w3-bar-item w3-button w3-text-red w3-hover-red"><b><i class="fa fa-map-marker w3-margin-right"></i>Yolo-Travel</b></a>
	<jsp:include page="member/loginform.jsp" />
	<%if (session.getAttribute("id") == null) {	%>
	<button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="document.getElementById('id01').style.display='block'">Login</button>
	<button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="document.getElementById('id02').style.display='block'">Subscribe</button>
	<button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="document.getElementById('id03').style.display='block'">Contact</button>	
	<%	} else if (session.getAttribute("id").equals("admin1")) {	%>	
	<strong class="welcome" style="font-size: 11px;"><%out.print(session.getAttribute("id") + "님 안녕하세요");%>	</strong>
	<button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="location='<%=request.getContextPath()%>/member/logOut.jsp'">Logout</button>
	<button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="location='sendMail.jsp'">메일전송</button>
	<button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="location='AirportManage.al'">회원예약관리</button>
	<button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="location='MemberMessage.jhw'">문의확인</button>
	<%} else {%>	
	<strong class="welcome" style="font-size: 11px;"><%out.print(session.getAttribute("id") + "님 안녕하세요");%>	</strong> 
	<button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="location='<%=request.getContextPath()%>/member/logOut.jsp'">Logout</button>
	<button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="location='AirportMemberReserv.al'">예약정보</button>
	<button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="document.getElementById('id02').style.display='block'">Subscribe</button>
	<button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="document.getElementById('id03').style.display='block'">Contact</button>		
	<%}%>
</div>
</html>