<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<title>Insert title here</title>
</head>

<style type="text/css">

@import url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo');
@import url('https://fonts.googleapis.com/css?family=Do+Hyeon');
@import url('https://fonts.googleapis.com/css?family=Baloo+Tammudu');
@import url('https://fonts.googleapis.com/css?family=Arvo|Baloo+Tammudu');
@import url('https://fonts.googleapis.com/css?family=Fjalla+One');

body {
	
}

.img {
	position: relative;
	background: url('./w3images/결과4.jpg');
	height: 100vh;
	background-size: cover;
}

.img-cover { /* 배경 반투명 커버부분 */
	position: absolute;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.4); /*검은색 배경에 투명도 지정  */
	z-index: 1; /*배경이미지 보다 앞에 있어야 하므로 z-index지정  */
}

.content { /* 배경 위 글씨 삽입 부분 */
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	/* font-size: 3rem; */
	color: white;
	z-index: 2;
	text-align: center;
	font-family: "Arvo|Baloo+Tammudu", sans-serif;
}

.button {
	display: inline-block;
	border-radius: 4px;
	background-color: #f4511e;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 28px;
	padding: 20px;
	width: 200px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
	opacity: 0.7;
}

.button:hover {
	opacity: 1;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}

h1 {
	font-size: 5em;
}

h2 {
	font-size: 3em;
}
</style>

<body>
	<%-- <c:if test="${check==1}"> --%>

	<div class="img">
		<div class="content">
			<h1>Hello!</h1>
			<h2>Thank you for being with us.</h2>
			<br><br>
			<button class="button" style="vertical-align: middle"
				onclick="location.href='./AirportMain.al'">
				<span>Go Home</span>
			</button>
		</div>
		<div class="img-cover"></div>

	</div>

	<%-- </c:if> --%>
</body>
</html>