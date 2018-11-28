<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>여행</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/js/AirPortListDropDown.js" ></script>
<script src="<%=request.getContextPath()%>/js/airportRank.js" type="text/javascript"></script>

<% String id = (String)session.getAttribute("id");%>
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

.button3-green {
	background-color: #e8e8e8;
	color: black; 
	border: 2px solid #9c959c; 
}

.button3:hover {
    background-color: #EAEAEA;
    color: black;
}

.button3-green:hover {
    background-color: #EAEAEA;
    color: black;
}
</style>
</head>
<body>
	<div class="centered main">
	<br><br><br><br>	
	<h1 style="color:#efefef;" class="headerfont">Airport Rank</h1>	
	<br>
		<div class="input-container">	
   		<div class="dropdown nanumfont">
   		&nbsp;<b style="color:#dedede;">출발공항 : &nbsp;</b><input class="input-field dia_bt area input aaa" id="txt5" value="${from}" placeholder="출발지" name="from" size="10" readonly="readonly" style="border-radius: 10px;"/>
    		<div class="dropdown-content area">
    			<table class="area ddTable">
    				<tr><td><h4 class="area" ><b class="area">국내</b></h4></td></tr>
    				<tr><td><a class ="contury" href="#;">인천</a></td><td><a class ="contury area" href="#;">서울</a></td><td class="area"><a class ="contury area" href="#;">부산</a></td><td class="area"><a class ="contury area" href="#;">제주</a></td></tr>
    				<tr><td><h4 class="area"><b class="area">중화권</b></h4></td></tr>
    				<tr><td><a class ="contury" href="#;">홍콩</a></td><td class="area"><a class ="contury" href="#;">타이페이</a></td><td class="area"><a class ="contury" href="#;">마카오</a></td><td class="area"><a class ="contury" href="#;">상하이</a></td><td class="area"><a class ="contury" href="#;">베이징</a></td><td class="area"><a class ="contury" href="#;">칭다오</a></td></tr>
    				<tr><td><h4 class="area"><b class="area">아시아</b></h4></td></tr>
    				<tr><td><a class ="contury" href="#;">도쿄</a></td><td class="area"><a class ="contury" href="#;">싱가포르</a></td><td class="area"><a class ="contury" href="#;">방콕</a></td><td class="area"><a class ="contury" href="#;">마닐라</a></td><td class="area"><a class ="contury" href="#;">쿠알라룸푸르</a></td><td class="area"><a class ="contury" href="#;">하노이</a></td></tr>
    				<tr><td><h4 class="area"><b class="area">미주/유럽</b></h4></td></tr>      
	    			<tr><td><a class ="contury" href="#;">런던</a></td><td class="area"><a class ="contury" href="#;">파리</a></td><td class="area"><a class ="contury" href="#;">체코</a></td><td class="area"><a class ="contury" href="#;">로스앤젤레스</a></td><td class="area"><a class ="contury" href="#;">뉴욕</a></td><td class="area"><a class ="contury" href="#;">샌프란시스코</a></td></tr>
    			</table>
      		</div>
    	</div>   
    	<div class="dropdown nanumfont">
   		&nbsp;&nbsp;<b style="color:#dedede;">도착공항 : &nbsp;</b><input class="input-field dia_bt2 area2 input aaa" id="txt6" value="${to}" placeholder="도착지" name="to" size="10" readonly="readonly" style="border-radius: 10px;"/>   
    		<div class="dropdown2-content area2">
      			<table class="area2 ddTable">
      				<tr><td class="area2"><h4 class="area2"><b class="area2">국내</b></h4></td></tr>
      				<tr><td><a class ="tocontury" href="#;" >인천</a></td><td><a class ="tocontury" href="#;">서울</a></td><td><a class ="tocontury" href="#;">부산</a></td><td><a class ="tocontury" href="#;">제주</a></td></tr>
      				<tr><td class="area2"><h4><b>중화권</b></h4></td></tr>
      				<tr><td><a class ="tocontury" href="#;">홍콩</a></td><td><a class ="tocontury" href="#;">타이페이</a></td><td><a class ="tocontury" href="#;">마카오</a></td><td><a class ="tocontury" href="#;">상하이</a></td><td><a class ="tocontury" href="#;">베이징</a></td><td><a class ="tocontury" href="#;">칭다오</a></td></tr>
     				<tr><td class="area2"><h4><b>아시아</b></h4></td></tr>
      				<tr><td><a class ="tocontury" href="#;">도쿄</a></td><td><a class ="tocontury" href="#;">싱가포르</a></td><td><a class ="tocontury" href="#;">방콕</a></td><td><a class ="tocontury" href="#;">마닐라</a></td><td><a class ="tocontury" href="#;">쿠알라룸푸르</a></td><td><a class ="tocontury" href="#;">하노이</a></td></tr>
      				<tr><td class="area2"><h4><b>미주/유럽</b></h4></td></tr>      
      				<tr><td><a class ="tocontury" href="#;">런던</a></td><td><a class ="tocontury" href="#;">파리</a></td><td><a class ="tocontury" href="#;">체코</a></td><td><a class ="tocontury" href="#;">로스앤젤레스</a></td><td><a class ="tocontury" href="#;">뉴욕</a></td><td><a class ="tocontury" href="#;">샌프란시스코</a></td></tr>
      			</table>
      		</div>
    	</div>  
			<div style="width:220px;">
      		<button id="btn5" class="button button3 input-field1 juafont" style="width: 100px;">검색</button>
      		<button id="btn6" class="button button3-green input-field1 juafont" style="width: 100px;" >변경</button>
      		</div>
	   	 </div>	
	</div>
	
	<!-- --------신규 수정부분 안내 글자 중앙정렬 배치--------------------------------- -->
	<div class="centered"> 
		<p class="prompt"></p>		
		<p class="prompt">주어진 출발 및 도착 공항을 가진 모든 항공편의 계산 된 등급 정보를 반환합니다.</p>
		<p class="prompt">Returns the calculated ratings information for all flights having the given departure and arrival airports</p>
		<br>
	</div>
	<div id="spec1" style="z-index:1;display:none;">
	<jsp:include page="reference.jsp"/>
	</div>
	
	<div id="dropdown3-hide" class="dropdown4-content centered" style="display:none; border-radius: 10px;">
		<div class="centered main" onmouseover="view(true)" onmouseout="view(false)">
			<table id="airportRank" class="display" width="100%"></table>		
		</div>
	</div>
	
	
	<!-- -------------------------------------------------------------------- -->
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
		<script>
function view(opt) {
  if(opt) {
     spec1.style.display = "block";
  }
  else {
     spec1.style.display = "none";
  }
}
</script>
 
</body>
</html>