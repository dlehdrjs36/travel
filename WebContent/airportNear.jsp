<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>근처 항공사 찾기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!--  jquery 라이브러리 -->
<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBGXKB1k8LOAYWW0KCV9G0NNupVvav0XAs"></script>
<script src="<%=request.getContextPath()%>/js/airportNear.js" type="text/javascript"></script>
<% String id = (String)session.getAttribute("id");%>
<style>
@import url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo'); /* 나눔명조 폰트  */
@import url('https://fonts.googleapis.com/css?family=Jua'); /* jua 폰트 */
@import url('https://fonts.googleapis.com/css?family=Dancing+Script'); 

nanum-myeongjo { /* 나눔명조 폰트 */
font-family: 'Nanum Myeongjo', serif;
}

.juafont { /* jua폰트 */
	font-family: 'Jua', sans-serif;
}
.headerfont { /* jua폰트 */
	font-family: 'Dancing Script', cursive;
}

</style>



</head>
<body>

	<br><br><br><br>
		
	<div class="centered">
	<h1 style="color:#efefef;" class="headerfont">Near Airport</h1>	
	</div>
	<br><br>
	 
		<div class="centered">
		<p class="prompt">현재 위치에서 가장 가까운 공항을 탐색합니다. 반경은 30 마일 입니다. 모든 시간은
			현지 시각 기준입니다 (지정된 위치의 지정된 반경 내에있는 공항의 목록을 반환합니다.)</p>
		<p class="prompt">Returns a listing of airports located within a
			specified radius of the given position.</p>
	</div>
	
	<br><br>
	<div class="dropdown3-content centered" style="border-radius: 10px;">
		<div class="centered-map Nanum-Myeongjo" style="font-size: 30px;">			
			<div class="w3-half w3-container" style="padding-top: 20px; margin-left: auto; margin-top: 20px;">				
				<img id="airport" src="">				
				<p id="airportName"></p>
			</div>

			<div class="w3-half w3-container">
				<div id="map1" style="width: 90%; height: 400px; margin-left: auto; margin-right: auto; margin-top: 32px;"></div>
			</div>
		</div>
	</div>

	<br>
	<br>
	
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