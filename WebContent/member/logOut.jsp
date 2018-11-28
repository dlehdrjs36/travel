<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate();
	%>
	<script>
		/*로그아웃시 localStorage 클리어 */
		localStorage.clear();
		location.href = "../AirportMain.al";
	</script>
	<%
		//response.sendRedirect("../AirportMain.al");
	%>
</body>
</html>