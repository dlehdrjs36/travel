<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%	request.setCharacterEncoding("UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- <html> -->
<head>
<title>운항정보</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/airport.css" type="text/css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<!--  달력 --> 
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /><!--  jQuery UI CSS파일-->  
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  <!--  jQuery 기본 js파일 -->
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script><!-- jQuery UI 라이브러리 js파일  -->
<!--  달력 -->
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/js/airportList.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/SearchViewCheck.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/GoogleMapMark.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/BingImageSearch.js"></script>
<% String id = (String)session.getAttribute("id");%>
<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
@import url('https://fonts.googleapis.com/css?family=Dancing+Script'); 
.Notofont { /* jua폰트 */
	font-family: 'Jua', sans-serif;
}
.Notofont{
font-family: 'Noto Sans KR', sans-serif;
}
.headerfont { /* jua폰트 */
	font-family: 'Dancing Script', cursive;
}

.button-set {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 15px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 20px;
	margin: 0px 0px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
	font-weight: bold;
	border-radius: 10px;
}
.button3-set {
	background-color: #e8e8e8;
	color: black; 
	border: 2px solid #9c959c; 
}
.button3-green-set {
	background-color: #e8e8e8;
	color: black;
	border: 2px solid #9c959c;  
}
.button3-green-set:hover {
	background-color: #EAEAEA;
	color: black;
}
.button3-set:hover {
	background-color: #EAEAEA;
	color: black;
}
</style>
</head> <!-- 
<body> --> 
	<div class="centered main">
	<br><br><br><br>	
	<h1 style="color:#efefef;" class="headerfont">flight information</h1>
	<br>		
		<form name="bing" action="<%=request.getContextPath()%>/AirportList.al" style="max-width:1100px; margin:auto" >
   			<div class="input-container">
   				<i class="fa fa-plane icon" style="font-size:24px"></i>	 <!-- 비행기 아이콘 -->  		
   				<div class="dropdown">   		
    				<input class="dia_bt input-field area bbb input" type="text" id="txt1" placeholder="출발지" name="f" readonly="readonly">  		
    				<div class="dropdown-content area">
    					<table class="area table ddTable">
    						<tr class="tr"><td class="area td"><h4><b>국내</b></h4></td></tr>
    						<tr class="tr"><td class="td"><a class ="contury" href="#;">인천</a></td><td class="td"><a class ="contury" href="#;">서울</a></td><td class="td"><a class ="contury" href="#;">부산</a></td><td class="td"><a class ="contury" href="#;">제주</a></td></tr>
    						<tr class="tr"><td class="area td"><h4><b>중화권</b></h4></td></tr>
    						<tr class="tr"><td class="td"><a class ="contury" href="#;">홍콩</a></td><td class="td"><a class ="contury" href="#;">타이페이</a></td><td class="td"><a class ="contury" href="#;">마카오</a></td><td class="td"><a class ="contury" href="#;">상하이</a></td><td class="td"><a class ="contury" href="#;">베이징</a></td><td class="td"><a class ="contury" href="#;">칭다오</a></td></tr>
    						<tr class="tr"><td class="area td"><h4><b>아시아</b></h4></td></tr>
    						<tr class="tr"><td class="td"><a class ="contury" href="#;">도쿄</a></td><td class="td"><a class ="contury" href="#;">싱가포르</a></td><td class="td"><a class ="contury" href="#;">방콕</a></td><td class="td"><a class ="contury" href="#;">마닐라</a></td><td class="td"><a class ="contury" href="#;">쿠알라룸푸르</a></td><td class="td"><a class ="contury" href="#;">하노이</a></td></tr>
    						<tr class="tr"><td class="area td"><h4><b>미주/유럽</b></h4></td></tr>      
	    					<tr class="tr"><td class="td"><a class ="contury" href="#;">런던</a></td><td class="td"><a class ="contury" href="#;">파리</a></td><td class="td"><a class ="contury" href="#;">체코</a></td><td class="td"><a class ="contury" href="#;">로스앤젤레스</a></td><td class="td"><a class ="contury" href="#;">뉴욕</a></td><td class="td"><a class ="contury" href="#;">샌프란시스코</a></td></tr>
    					</table>
      				</div>
    			</div>    	
				<i class="fa fa-plane icon" style="font-size:24px"></i>
    				<div class="dropdown2">   
    					<input class="dia_bt2 input-field area2 bbb input" type="text"  id="txt2" placeholder="도착지" name="t" readonly="readonly">
    					<div class="dropdown2-content area2">
      						<table class="area2 table ddTable">
      							<tr class="tr"><td class="area2 td"><h4><b>국내</b></h4></td></tr>
      							<tr class="tr"><td class="td"><a class ="tocontury" href="#;">인천</a></td><td class="td"><a class ="tocontury" href="#;">서울</a></td><td class="td"><a class ="tocontury" href="#;">부산</a></td><td class="td"><a class ="tocontury" href="#;">제주</a></td></tr>
      							<tr class="tr"><td class="area2 td"><h4><b>중화권</b></h4></td></tr>
      							<tr class="tr"><td class="td"><a class ="tocontury" href="#;">홍콩</a></td><td class="td"><a class ="tocontury" href="#;">타이페이</a></td><td class="td"><a class ="tocontury" href="#;">마카오</a></td><td class="td"><a class ="tocontury" href="#;">상하이</a></td><td class="td"><a class ="tocontury" href="#;">베이징</a></td><td class="td"><a class ="tocontury" href="#;">칭다오</a></td></tr>
     							<tr class="tr"><td class="area2 td"><h4><b>아시아</b></h4></td></tr>
      							<tr class="tr"><td class="td"><a class ="tocontury" href="#;">도쿄</a></td><td class="td"><a class ="tocontury" href="#;">싱가포르</a></td><td class="td"><a class ="tocontury" href="#;">방콕</a></td><td class="td"><a class ="tocontury" href="#;">마닐라</a></td><td class="td"><a class ="tocontury" href="#;">쿠알라룸푸르</a></td><td class="td"><a class ="tocontury" href="#;">하노이</a></td></tr>
      							<tr class="tr"><td class="area2 td"><h4><b>미주/유럽</b></h4></td></tr>      
      							<tr class="tr"><td class="td"><a class ="tocontury" href="#;">런던</a></td><td class="td"><a class ="tocontury" href="#;">파리</a></td><td class="td"><a class ="tocontury" href="#;">체코</a></td><td class="td"><a class ="tocontury" href="#;">로스앤젤레스</a></td><td class="td"><a class ="tocontury" href="#;">뉴욕</a></td><td class="td"><a class ="tocontury" href="#;">샌프란시스코</a></td></tr>
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
  				<h3 style="color:gainsboro; font-family:나눔바른고딕;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  				성인&nbsp;&nbsp;</h3>
  				
    			<a href="javascript:;" style="font-size:20px; color:gainsboro;" class="bt_up fa fa-plus cal no-uline " > </a> <!-- 숫자 부분  -->    			
    			<input class="num input2" type="text" placeholder="성인" value="0" readonly="readonly" name="num" >
    			<a href="javascript:;" style="font-size:20px; color:gainsboro;" class="bt_down fa fa-minus cal no-uline" > </a>     			
    			
    			<h3 style="color:gainsboro; font-family:나눔바른고딕;">&nbsp;&nbsp;&nbsp;&nbsp;좌석 등급 &nbsp;&nbsp;&nbsp;</h3> <!-- 좌석 등급 부분  -->
    			<select name="seat"  style="font-weight:bold; font-size:20px;">
    				<option value="일반" ><b>일반</b></option>
    				<option value="비즈니스" ><b>비즈니스</b></option>
    			</select>
    			
    			
  			</div>
			<input type="hidden" name="from"/>
			<input type="hidden" name="to"/>
			<input type="hidden" id="fromName" name="fromName">
			<input type="hidden" id="toName" name="toName"> 
			<input type="hidden" id="fromLatitude" name="fromLatitude">
			<input type="hidden" id="fromLongitude" name="fromLongitude"> 
			<input type="hidden" id="toLatitude" name="toLatitude">
			<input type="hidden" id="toLongitude" name="toLongitude">
			<input type="hidden" id="toCountryCode" name="toCountryCode">
			<input type="hidden" id="fromCountryCode" name="fromCountryCode">
  			<button type="button" id="btn" class="button-set button3-set input-field1 Notofont">조회</button>
  			<button id="btn2" class="button-set button3-green-set input-field1 Notofont" >변경</button>
     		
     		<p style="display:none;">
     			<select name="where">
            		<option value="es-AR">Argentina (Spanish)</option>
            		<option value="en-AU">Australia (English)</option>
            		<option value="de-AT">Austria (German)</option>
            		<option value="nl-BE">Belgium (Dutch)</option>
            		<option value="fr-BE">Belgium (French)</option>
            		<option value="pt-BR">Brazil (Portuguese)</option>
            		<option value="en-CA">Canada (English)</option>
            		<option value="fr-CA">Canada (French)</option>
            		<option value="es-CL">Chile (Spanish)</option>
            		<option value="da-DK">Denmark (Danish)</option>
            		<option value="fi-FI">Finland (Finnish)</option>
            		<option value="fr-FR">France (French)</option>
            		<option value="de-DE">Germany (German)</option>
            		<option	value="zh-HK">Hong Kong (Traditional Chinese)</option>
            		<option value="en-IN">India (English)</option>
            		<option value="en-ID">Indonesia (English)</option>
            		<option value="it-IT">Italy (Italian)</option>
            		<option value="ja-JP">Japan (Japanese)</option>
            		<option value="ko-KR">Korea (Korean)</option>
            		<option value="en-MY">Malaysia (English)</option>
            		<option value="es-MX">Mexico (Spanish)</option>
            		<option value="nl-NL">Netherlands (Dutch)</option>
            		<option value="en-NZ">New Zealand (English)</option>
            		<option value="no-NO">Norway (Norwegian)</option>
            		<option value="zh-CN">People's Republic of China (Chinese)</option>
            		<option value="pl-PL">Poland (Polish)</option>
            		<option value="pt-PT">Portugal (Portuguese)</option>
            		<option value="en-PH">Philippines (English)</option>
            		<option value="ru-RU">Russia (Russian)</option>
            		<option value="ar-SA">Saudi Arabia (Arabic)</option>
            		<option value="en-ZA">South Africa (English)</option>
            		<option value="es-ES">Spain (Spanish)</option>
            		<option value="sv-SE">Sweden (Swedish)</option>
            		<option value="fr-CH">Switzerland (French)</option>
            		<option value="de-CH">Switzerland (German)</option>
            		<option value="zh-TW">Taiwan (Traditional Chinese)</option>
            		<option value="tr-TR">Turkey (Turkish)</option>
            		<option value="en-GB">United Kingdom (English)</option>
            		<option value="en-US" selected>United States (English)</option>
            		<option value="es-US">United States (Spanish)</option>
        		</select>
			<div id="query" style="display:none;"><!-- query controls including search field and options (검색 필드 및 옵션을 포함한 쿼리 컨트롤)-->
        			<input type="text" name="query" id="term" placeholder="Search for images" autocomplete=off>
        			<p>Aspect
    					<input type=radio name="aspect" id="any" value="all" checked>
        				<label for="any">Any</label>
    					<input type=radio name="aspect" id="square" value="square">
        				<label for="square">Square</label>
    					<input type=radio name="aspect" id="wide" value="wide">
        				<label for="wide">Wide</label>
    					<input type=radio name="aspect" id="tall" value="tall">
        				<label for="tall">Tall</label>
        		&nbsp;&nbsp;&nbsp;Color
    					<select name="color">
        					<option value="" selected>Any</option>
        					<option value="coloronly">Only Color</option>
        					<option value="monochrome">Black and White</option>
       						<option value="black">Black</option>
        					<option value="blue">Blue</option>
        					<option value="black">Brown</option>
        					<option value="gray">Gray</option>
        					<option value="green">Green</option>
        					<option value="orange">Orange</option>
        					<option value="pink">Pink</option>
        					<option value="purple">Purple</option>
        					<option value="red">Red</option>
        					<option value="teal">Teal</option>
        					<option value="white">White</option>
        					<option value="yellow">Yellow</option>                
    					</select>
        		&nbsp;&nbsp;&nbsp;From
    					<select name="when">
        					<option value="" selected>All time</option>
        					<option value="month">Past month</option>
        					<option value="week">Past week</option>
        					<option value="day">Last 24 hours</option>
    					</select>
    				</p>
    &nbsp;&nbsp;&nbsp;<input type=checkbox id="safe" name="safe" value="on" checked><label for="safe">SafeSearch</label>
    <!-- these hidden fields control paging 이러한 숨겨진 필드는 페이징을 제어합니다.-->
   				<input type=hidden name="count" value="25">
    			<input type=hidden name="offset" value="0">
    			<input type=hidden name="nextoffset" value="">    
    			<input type=hidden name="stack" value="[]"> 
  			</div>
		</form>
	</div>
	
	<!--<c:if test="${check2==1}">
		<script> reserv('${f}','${t}','${fromdate}','${todate}','${num}','${seat}'); getAirLine('${from}','${to}','${fromdate}');
		var frm = document.forms.bing;
		bing.query.value = '${dto.toName}';
	    newBingImageSearch(frm);
	</script>
	</c:if>-->
    	
    <p class="prompt" style="text-align: center;">표시 금액은 1인당 운임입니다 (예상 TAX 및 유류할증료 포함)  모든 출발·도착 시간은 현지 시각 기준입니다</p>
	<!-- <div id="dropdown3-hide" class="dropdown3-content centered" style="display:none;">-->
	<c:choose>
	<c:when test="${check2==1}">
    	<script> reserv('${f}','${t}','${fromdate}','${todate}','${num}','${seat}','${dto.fromName}','${dto.toName}'); getAirLine('${from}','${to}','${fromdate}');
				 var frm = document.forms.bing;
				 bing.query.value = '${dto.toName}+travel';
	    	 	newBingImageSearch(frm);
		</script>
     	<div id="dropdown3-hide" class="dropdown3-content centered" style="display:block; border-radius: 10px;">
    </c:when>
    <c:otherwise>
    	<div id="dropdown3-hide" class="dropdown3-content centered" style="display:none; border-radius: 10px;"> 
    </c:otherwise>
	</c:choose>
		<div>
<!--     		<div id="error">
    			<div id="_error"></div>
			</div>
		<div id="paging1">
    			<div id="_paging1"></div>
			</div>
			<div id="noresults">
    			<div id="_noresults">None yet.</div>
			</div>
			<div id="sidebar">
    			<div id="_sidebar"></div>
			</div>
			
		<div id="json">
    			<h3><a href="#" onclick="return toggleDisplay('_json')">JSON</a></h3>
    		<div id="_json" style="display: none"></div>
			</div>
			<div id="http">
    			<h3><a href="#" onclick="return toggleDisplay('_http')">HTTP</a></h3>
    		<div id="_http" style="display: none"></div>
			</div>	 -->	
			<jsp:include page="mapmark.jsp">
			<jsp:param value="1" name="check"/>
		    <jsp:param value="${dto.fromName}" name="dtoFromName"/>
		    <jsp:param value="${dto.toName}" name="dtoToName"/>
			<jsp:param value="${dto.fromLatitude}" name="dtoFromLatitude"/>
			<jsp:param value="${dto.toLatitude}" name="dtoToLatitude"/>        
			<jsp:param value="${dto.fromLongitude}" name="dtoFromLongitude"/>       
			<jsp:param value="${dto.toLongitude}" name="dtoToLongitude"/>
			</jsp:include>		 		
			
			<div class='w3-half w3-container' id="results">
    			<div id="_results"></div>
    			
    			<div id="paging2">
    			<div id="_paging2"></div>
				</div>
			</div>
		</div>
		<table id="realTime" class="display table" width="100%"></table>	
	</div>
	
<!-- <div class="footer">
    <div class="ui divided grid">
        <div class="row">
          <div class="four wide column"><a><h2>Create By</h2></div>
          <div class="four wide column"><a></i><br>MAIL<br>xxx@xxxx.com</a></div>
          <div class="four wide column"><a id="liked"><i class="huge phone icon"></i><br>CALL<br>Number : 053-421-2460<br>FAX : 053-356-3939</a></div>
          <div class="four wide column"><a><i class="huge map marker alternate icon"></i><br>FIND US<br>대구광역시 중구 국채보상로 537 (수동, 5층)</a></div>
        </div>
    </div>    
    <small> Thanks To : Yedam Vocational Training Institute<br>Copyright &copy; 2018 Yestagram</small>
</div>
 -->
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