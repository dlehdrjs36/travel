<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/airport.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath()%>/js/airportManage.js"></script>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

</head>
<body>
	<div style="height:5%;">
		<jsp:include page="../header.jsp" />
	</div>
	
	<div id="datatable" style="display: none;">
	<table id="example" class="display" border="1">
		<thead>
		<tr>
			<td>회원ID</td>
			<td>출발지</td>
			<td>도착지</td>
			<!-- <td>출발날짜</td>-->
			<td>출발시간</td>
			<td>도착시간</td>
			<td>비행기번호</td>
			<td>표</td>
			<td>좌석</td>
			<!-- <td>가격</td>-->
			<td>총가격</td>
			<td>항공사</td>
			<td>성</td>
			<td>이름</td>
			<td>국적</td>
			<td>휴대전화</td>
			<td>이메일</td>
			<td>예약날짜</td>
			
			<td>예약취소</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${ReservationList}" var="dto" varStatus="status">	
	<%--${status.index}<br/> --%>	
		<tr>
			<td>${dto.ID}</td>
			<td>${dto.DEPARTURE}</td>
			<td>${dto.ARRIVAL}</td>
			<!-- <td>${dto.DEPARTURE_DATE}</td>-->
			<td>${dto.DEPARTURE_TIME}</td>
			<td>${dto.ARRIVAL_TIME}</td>
			<td>${dto.FLIGHT_NUMBER}</td>
			<td>${dto.TICKET}</td>
			<td>${dto.SEAT}</td>
			<!-- <td>${dto.PRICE}</td>-->
			<td>${dto.TOTAL_PRICE}</td>
			<td>${dto.AIRLINE}</td>
			<td>${dto.LNAME}</td>
			<td>${dto.FNAME}</td>		
			<td>${dto.NATIONALITY}</td>
			<td>${dto.PHONE}</td>
			<td>${dto.EMAIL}</td>
			<td>${dto.RESERVATION_DATE}</td>
			
			<td><a href="./AirportCancel.al?id=${dto.ID}&date=${dto.RESERVATION_DATE}&fn=${dto.FLIGHT_NUMBER}" onclick="return delchk();">취소</a></td>
		</tr>
		</c:forEach>
		</tbody>
		</table>
		<div style="text-align: center;">
			검색 : <input type="text" id="myInputTextField">
		</div>
	</div>
</body>
</html>