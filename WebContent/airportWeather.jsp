<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>날씨</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBGXKB1k8LOAYWW0KCV9G0NNupVvav0XAs"></script>
<script src="<%=request.getContextPath()%>/js/airportWeather.js" type="text/javascript"></script>
<!-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/airport.css" />-->
<%	String id = (String) session.getAttribute("id"); %>


<style>
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic'); /* 나눔폰트 */
@import url('https://fonts.googleapis.com/css?family=Jua'); /* Jua폰트 */
@import url('https://fonts.googleapis.com/css?family=Dancing+Script'); 

.nanumfont { /* 나눔폰트  */
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 20px;
}

.juafont { /* jua폰트 */
	font-family: 'Jua', sans-serif;
}
.headerfont { /* jua폰트 */
	font-family: 'Dancing Script', cursive;
}
.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 10px 30px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 20px;
	margin: 0px 0px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
	border-radius: 10px;
}

.button3 {
	background-color: #e8e8e8;
	color: black; 
	border: 2px solid #9c959c; 
}

.button3:hover {
    background-color: #EAEAEA;
    color: black;
}
</style>

</head>
<body>
<br><br><br><br>		
	<div class="centered main">	
	<h1 style="color:#efefef;" class="headerfont">Airport Weather</h1>
	<br>
		<div class="input-container">
			<div class="dropdown nanumfont">
				&nbsp;<b style="color:#dedede;">출발공항 : &nbsp;&nbsp;</b> <input class="input-field dia_bt area input bbb" id="txt4" value="${from}"
					placeholder="날씨" name="from" size="10" readonly="readonly" style="border-radius: 10px;"/>
				<div class="dropdown-content area">
					<table class="area ddTable">
						<tr class="trr">
							<td><h4 class="area">
									<b class="area">국내</b>
								</h4></td>
						</tr>
						<tr class="trr">
							<td><a class="contury" href="#;">인천</a></td>
							<td><a class="contury" href="#;">서울</a></td>
							<td class="area"><a class="contury" href="#;">부산</a></td>
							<td class="area"><a class="contury" href="#;">제주</a></td>
						</tr>
						<tr class="trr">
							<td><h4 class="area">
									<b class="area">중화권</b>
								</h4></td>
						</tr>
						<tr class="trr">
							<td><a class="contury" href="#;">홍콩</a></td>
							<td class="area"><a class="contury" href="#;">타이페이</a></td>
							<td class="area"><a class="contury" href="#;">마카오</a></td>
							<td class="area"><a class="contury" href="#;">상하이</a></td>
							<td class="area"><a class="contury" href="#;">베이징</a></td>
							<td class="area"><a class="contury" href="#;">칭다오</a></td>
						</tr>
						<tr class="trr">
							<td><h4 class="area">
									<b class="area">아시아</b>
								</h4></td>
						</tr>
						<tr class="trr">
							<td><a class="contury" href="#;">도쿄</a></td>
							<td class="area"><a class="contury" href="#;">싱가포르</a></td>
							<td class="area"><a class="contury" href="#;">방콕</a></td>
							<td class="area"><a class="contury" href="#;">마닐라</a></td>
							<td class="area"><a class="contury" href="#;">쿠알라룸푸르</a></td>
							<td class="area"><a class="contury" href="#;">하노이</a></td>
						</tr>
						<tr class="trr">
							<td><h4 class="area">
									<b class="area">미주/유럽</b>
								</h4></td>
						</tr>
						<tr class="trr">
							<td><a class="contury" href="#;">런던</a></td>
							<td class="area"><a class="contury" href="#;">파리</a></td>
							<td class="area"><a class="contury" href="#;">체코</a></td>
							<td class="area"><a class="contury" href="#;">로스앤젤레스</a></td>
							<td class="area"><a class="contury" href="#;">뉴욕</a></td>
							<td class="area"><a class="contury" href="#;">샌프란시스코</a></td>
						</tr>
					</table>
				</div>
			</div>
			<div>
				<%-- <input class="dia_bt3" id="txt4" value="${from}" size="10"/>  --%>
				&nbsp;&nbsp;
				<button class="button button3 input-field1 juafont" id="btn3">검색</button>
			</div>
		</div>
	</div>
	<div class="centered">
	<br>
	<p class="prompt">특정 공항 주변의 비행장에 대한 가장 최근의 METAR 일기 예보를 검색하십시오. METAR 보고서는 현재 상태를 기술하고 약 1 시간마다 업데이트됩니다.</p>
	<p class="prompt">Retrieve the most current available METAR weather report for the aerodrome around a given airport. METAR reports describe current conditions and are updated about once an hour.</p>
	</div>
	<br>
	<div id="dropdown3-hide" style="display:none;">
	<div class="dropdown3-content centered" style="border-radius: 10px;">
		<!-- <div class="centered-map juafont" style="font-size: 30px;"> -->
			<div class="w3-half w3-container juafont" style="padding:20px; font-size:30px;">
				<p id="name"></p>
				<p id="city"></p>
				<p id="temperatureCelsius"></p>
				<p id="value"></p>
				<p id="speedKnots"></p>
				<img id="weather" src="">
			</div>
			<div class="w3-half w3-container" style="padding:20px; font-size:30px;">
				<div id="map" style="width: 100%; height: 400px;"></div>
			</div>
			<br>
		<!-- </div> -->
	</div>
	</div>
	
<footer class="w3-container footer" style="padding:16px">
  <a href="#" class="w3-button w3-black w3-padding-large w3-margin-bottom"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
    <br>
  <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
</footer>

</body>
</html>