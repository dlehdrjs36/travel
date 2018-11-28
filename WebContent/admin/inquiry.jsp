<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 메시지</title>
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
			<td>이름</td>
			<td>Email</td>
			<td>Message</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${inquiryList}" var="dto" varStatus="status">	
		<tr>
			<td>${dto.name}</td>
			<td>${dto.email}</td>
			<td>${dto.message}</td>
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