<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contentPage=request.getParameter("contentPage");
	if(contentPage==null)
	    contentPage="airportList.jsp";
	
	request.setCharacterEncoding("UTF-8");	
 	response.setContentType("text/html;charset=utf-8");
	response.setCharacterEncoding("UTF-8"); 
%>
<!DOCTYPE html>
<html>
<head>
<title> Main페이지</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/airport.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
<meta charset="utf-8">

<style>
.img { /* 배경화면 조절 */
	position: relative;
	background: url('./w3images/배경2.jpg');
	height: 100%;
	width: 100%;
	background-size: cover;
}
#videobcg { 
     position: fixed;
     top: 0px;
     left: 0px;
     min-width: 100%;
     min-height: 100%;
     width: auto;
     height: auto;
     z-index: -1000;
     overflow: hidden;
}
</style>
</head>

<!-- <body class="img"> -->
<body>


<video id="videobcg" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
     <source src="lax-big.mp4" type="video/mp4">
     <source src="movie.webm" type="video/webm">
          Sorry, your browser does not support HTML5 video.
</video>

	<jsp:include page="rank.jsp"/>
	<div style="height:5%;">
	<jsp:include page="header.jsp" />
	</div>
	<div class="sidebar" style="width:13%; height:100%;">
	<jsp:include page="sidebar.jsp" />
	</div>
	<!--  메인화면 부분 -->
	<div style="width:100%; height:100%;float:left;">
	<jsp:include page="<%=contentPage%>" />
	</div><%-- 
	<jsp:include page="footer.jsp" /> --%>
	
	<div id="_chatbox" style="display:none">
    <fieldset style="background-color: #e0e0e0;border-radius: 10px;">
        <textarea id="messageWindow" rows="10" cols="30" readonly="true" autofozus required style="resize: none;background-color: #f1f1f1;"></textarea>
        <br/>
        <input class="typetext" id="inputMessage" type="text" onkeydown="keydown();" style="background-color: #f1f1f1;"/>
        <!-- <input type="submit" value="send" onclick="send()" /> -->
    </fieldset>  
    </div>
    
    <%if (session.getAttribute("id") != null) {	%>
    <img id="_chatimage" class="chat" src="./img/chat.png" />
    <%} %>    
    
    <script>
    	function keydown()
    	{    		
    		if(event.keyCode==13)
    		{	
    			var objDiv = document.getElementById("messageWindow"); 
        		objDiv.scrollTop = objDiv.scrollHeight;
    			send();
    			return false;
    		} 		  
    	}
    	
    	/*ajax로 데이터 가져오기 */
    	var sid = "<%=(String)session.getAttribute("id")%>";
    	console.log(sid);

    	function getDigit(a){
    		if (a.length == 1)
    			var comp = "0".concat(a);
    		else
    			var comp = a;
    		return comp;
    	}
    	if (sid != "null") {
    		console.log(getDigit("8"));
    		var startDate;
    		console.log(localStorage.getItem('startDate'));
    		if(localStorage.getItem('startDate') == null){
    			console.log("in");
    			var sd = new Date();
    			//2018/09/19 10:05:07
    			var $year = sd.getFullYear();
    			var $mon = (sd.getMonth()+1);
    			var $day =  (sd.getDate());
    			var $hour = (sd.getHours());
    			var $min = (sd.getMinutes());
    			var $sec = (sd.getSeconds());

    			var sDate = ($year)+"/"+getDigit($mon.toString())+"/"+getDigit($day.toString())+" "+getDigit($hour.toString())+":"+getDigit($min.toString())+":"+getDigit($sec.toString());
    			localStorage.setItem('startDate',sDate);
    			console.log(localStorage.getItem('startDate'));
    		}
    		console.log("out");
    		startDate = localStorage.getItem('startDate');
    		console.log(localStorage.getItem('startDate'));

    		$.ajax({
    			url : "ChatMsg?startDate="+startDate,
    			success : function(result){
    				var datas = JSON.parse(result);
    				var res = "";
    				for(var i=0;i<datas.length;i++){
    					res += datas[i]+"\n";
    				}
    				$("#messageWindow").val("");
    				$("#messageWindow").val(res);
    				$("#messageWindow").scrollTop(5000);
    			}
    		})

    	}else{
    		console.log("else")
    		console.log(localStorage.getItem('startDate'));
    		
    	}
    	
    	
    	/*채팅 이미지 클릭시*/    	
        $(".chat").on({
            "click" : function() {
                if ($(this).attr("src") == "./img/chat.png") {
                    $(".chat").attr("src", "./img/chathide.png");
                    $("#_chatbox").fadeIn();
                } else if ($(this).attr("src") == "./img/chathide.png") {
                    $(".chat").attr("src", "./img/chat.png");
                    $("#_chatbox").fadeOut();
                }
            }
        });
        
        var textarea = document.getElementById("messageWindow");
        /* var webSocket = new WebSocket('wss://192.168.0.73:8443/travel/broadcasting'); */
        var webSocket = new WebSocket('ws://localhost:8443/travel/broadcasting'); 
        var inputMessage = document.getElementById('inputMessage');
        
    	webSocket.onerror = function(event) {
    	  onError(event)
    	};
    	webSocket.onopen = function(event) {
    	  onOpen(event)
    	};
    	webSocket.onmessage = function(event) {
    	  onMessage(event)
    	};
    	function onMessage(event) {
    	    textarea.value += event.data + "\n";
    	}
    	function onOpen(event) {
    	    /* textarea.value += "연결 되었습니다.\n"; */
    	}
    	function onError(event) {
    	  alert(event.data);
    	}
    	function send() {
    		var sendVar = "<%=session.getAttribute("id")%> : " +inputMessage.value;
    	    textarea.value += "<%=session.getAttribute("id")%> : " + inputMessage.value + "\n";
    	    webSocket.send(sendVar);
    	    inputMessage.value = "";
    	}
   
    </script>	    
</body>
</html>