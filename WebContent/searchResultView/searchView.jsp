<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<title>여행</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-latest.min.js"></script> <!--  jquery 라이브러리 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/SearchViewCheck.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/SearchViewSubmitCheck.js"></script>
<!--  스타일 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/airport.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> <!--  아이콘-->
<!--  달력 --> 
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /><!--  jQuery UI CSS파일-->  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  <!--  jQuery 기본 js파일 -->
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script><!-- jQuery UI 라이브러리 js파일  -->
</head>
<body>
<!--  타이틀 -->
<div class="w3-display-container" style="margin-bottom:50px">
	<img class="img" src="<%=request.getContextPath()%>/w3images/beach3.jpg" style="width:100%; height:1000px;"> <!-- 배경화면 높이 넓이  -->
	<div class="w3-display-bottomleft w3-container w3-amber w3-hover-orange w3-hide-small" style="bottom:10%; opacity:0.7; width:70%">
		<h2><b>${dto.title}<br>${dto.content}</b></h2>
	</div>
</div>


<!--  지도 -->
<div class="w3-row w3-container" style="margin:50px 0">
<jsp:include page="/mapmark.jsp"></jsp:include>

<!--  이미지 슬라이더 -->
<div class="w3-half w3-container">
	<div class="w3-topbar w3-border-amber">
    	<div class="slideshow-container">
			<c:forEach var="l" items="${list}">
				<div class="mySlides fade">
					<div class="numbertext">${l.count}/ ${list.size()}</div>
						<img class="img" src="<%=request.getContextPath()%>/img/${l.fileName}" style="width: 100%;height:400px;">
				</div>
			</c:forEach>
			<a class="prev" onclick="plusSlides(-1)">&#10094;</a> 
			<a class="next2" onclick="plusSlides(1)">&#10095;</a>
		</div>
	<br>
		<div style="text-align: center">
			<c:forEach var="l" items="${list}">
				<span class="dot" onclick="currentSlide(${l.count})"></span>
			</c:forEach>
		</div>
	</div>
</div>

</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/SearchView.js"></script>




<%-- <!--  항공편 조회폼 -->
<form action="<%=request.getContextPath()%>/AirportList.al" style="max-width:1100px; margin:auto" onsubmit="return check()">
   	<div class="input-container">
   		<i class="fa fa-plane icon" style="font-size:24px"></i>	 <!-- 비행기 아이콘 -->
   		
   		<div class="dropdown">
    		
    		<input id="dia_bt" class="input-field area bbb input" type="text" placeholder="출발지" name="f" readonly="readonly">
    		
    		<div class="dropdown-content area">
    			<table class="area table">
    				<tr class="tr"><td class="area td"><h4><b>국내</b></h4></td></tr>
    				<tr class="tr"><td class="td"><a class ="contury" href="#;">인천</a></td><td class="td"><a class ="contury" href="#;">서울</a></td><td class="td"><a class ="contury" href="#;">부산</a></td><td class="td"><a class ="contury" href="#;">제주</a></td></tr>
    				<tr class="tr"><td class="area td"><h4><b>중화권</b></h4></td></tr>
    				<tr class="tr"><td class="td"><a class ="contury" href="#;">홍콩</a></td><td class="td"><a class ="contury" href="#;">타이페이</a></td><td class="td"><a class ="contury" href="#;">마카오</a></td><td class="td"><a class ="contury" href="#;">상하이</a></td><td class="td"><a class ="contury" href="#;">베이징</a></td><td class="td"><a class ="contury" href="#;">칭다오</a></td></tr>
    				<tr class="tr"><td class="area td"><h4><b>아시아</b></h4></td></tr>
    				<tr class="tr"><td class="td"><a class ="contury" href="#;">도쿄</a></td><td class="td"><a class ="contury" href="#;">싱가포르</a></td><td class="td"><a class ="contury" href="#;">방콕</a></td><td class="td"><a class ="contury" href="#;">마닐라</a></td><td class="td"><a class ="contury" href="#;">쿠알라룸푸르</a></td><td class="td"><a class ="contury" href="#;">하노이</a></td></tr>
    				<tr class="tr"><td class="area td"><h4><b>미주/유럽</b></h4></td></tr>      
	    			<tr class="tr"><td class="td"><a class ="contury" href="#;">런던</a></td><td class="td"><a class ="contury" href="#;">파리</a></td><td class="td"><a class ="contury" href="#;">로마</a></td><td class="td"><a class ="contury" href="#;">로스앤젤레스</a></td><td class="td"><a class ="contury" href="#;">뉴욕</a></td><td class="td"><a class ="contury" href="#;">샌프란시스코</a></td></tr>
    			</table>
      		</div>
    	</div>
    	
    	
		<i class="fa fa-plane icon" style="font-size:24px" ></i>
    	<div class="dropdown2">   
    		<input id="dia_bt2" class="input-field area2 bbb input" type="text" placeholder="도착지" name="t" readonly="readonly">
    		<div class="dropdown2-content area2">
      			<table class="area2 table">
      				<tr class="tr"><td class="area2 td"><h4><b>국내</b></h4></td></tr>
      				<tr class="tr"><td class="td"><a class ="tocontury" href="#;">인천</a></td><td class="td"><a class ="tocontury" href="#;">서울</a></td><td class="td"><a class ="tocontury" href="#;">부산</a></td><td class="td"><a class ="tocontury" href="#;">제주</a></td></tr>
      				<tr class="tr"><td class="area2 td"><h4><b>중화권</b></h4></td></tr>
      				<tr class="tr"><td class="td"><a class ="tocontury" href="#;">홍콩</a></td><td class="td"><a class ="tocontury" href="#;">타이페이</a></td><td class="td"><a class ="tocontury" href="#;">마카오</a></td><td class="td"><a class ="tocontury" href="#;">상하이</a></td><td class="td"><a class ="tocontury" href="#;">베이징</a></td><td class="td"><a class ="tocontury" href="#;">칭다오</a></td></tr>
     				<tr class="tr"><td class="area2 td"><h4><b>아시아</b></h4></td></tr>
      				<tr class="tr"><td class="td"><a class ="tocontury" href="#;">도쿄</a></td><td class="td"><a class ="tocontury" href="#;">싱가포르</a></td><td class="td"><a class ="tocontury" href="#;">방콕</a></td><td class="td"><a class ="tocontury" href="#;">마닐라</a></td><td class="td"><a class ="tocontury" href="#;">쿠알라룸푸르</a></td><td class="td"><a class ="tocontury" href="#;">하노이</a></td></tr>
      				<tr class="tr"><td class="area2 td"><h4><b>미주/유럽</b></h4></td></tr>      
      				<tr class="tr"><td class="td"><a class ="tocontury" href="#;">런던</a></td><td class="td"><a class ="tocontury" href="#;">파리</a></td><td class="td"><a class ="tocontury" href="#;">로마</a></td><td class="td"><a class ="tocontury" href="#;">로스앤젤레스</a></td><td class="td"><a class ="tocontury" href="#;">뉴욕</a></td><td class="td"><a class ="tocontury" href="#;">샌프란시스코</a></td></tr>
      			</table>
      		</div>
    	</div>   
  	</div>
  <div class="input-container">
  	<i class="fa fa-calendar icon" style="font-size:24px"></i> <!-- 달력 아이콘  -->
    <input class="input-field testDatepicker bbb input" type="text" placeholder="출발날짜" name="fromdate" id="fromdate" readonly="readonly">
    <i class="fa fa-calendar icon" style="font-size:24px"></i>
    <input class="input-field testDatepicker bbb input" type="text" placeholder="도착날짜" name="todate" id="todate" readonly="readonly">
  </div>
  
  
  <div class="input-container">	
  	<h2><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	성인&nbsp;&nbsp;</b> </h2>
  	
    <a href="javascript:;" style="font-size:30px" class="bt_up fa fa-plus cal no-uline " > </a> <!-- 숫자 부분  -->
    <input class="num input" type="text" placeholder="성인" value="0" readonly="readonly" name="num">
    

    <a href="javascript:;" style="font-size:30px" class="bt_down fa fa-minus cal no-uline" > </a> <!-- 좌석 등급 부분  -->
    
    <h2><b>&nbsp;&nbsp;&nbsp;&nbsp;좌석 등급 &nbsp;&nbsp;&nbsp;</b></h2>
    <select name="seat" font-size="10px">
    	<option value="일반"><b>일반</b></option>
    	<option value="비즈니스"><b>비즈니스</b></option>
    </select>
  </div>
  <input type="hidden" name="from"/>
  <input type="hidden" name="to"/>
  <button type="submit" class="btn" id="getBtn">조회</button><br><br><br><br>
</form> --%>
</body>
</html>