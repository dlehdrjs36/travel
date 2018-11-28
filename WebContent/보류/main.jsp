<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html><head><title>여행</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script><!-- JQuery 호출하기 위한 링크 선언 -->
<script src="<%=request.getContextPath()%>/js/main.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/airport.css" />
<% String id = (String)session.getAttribute("id");%>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
.myLink {display: none}
</style>
</head>
<body class="w3-light-grey" contenteditable="false">
<%-- <jsp:include page="rank.jsp"/>
<jsp:include page="Rheader.jsp"/>
<jsp:include page="member/loginform.jsp"/> --%>
<jsp:include page="header.jsp"/>

<!-- Page content -->
<div class="w3-content" style="max-width:1100px;">

  
  <!-- 채팅 -->
   <div id="_chatbox" style="display: none">
    <fieldset>
        <textarea id="messageWindow" rows="10" cols="30" readonly="true" autofozus required style="resize: none"></textarea>
        <br/>
        <input class="typetext" id="inputMessage" type="text"/>
        <input type="submit" value="send" onclick="send()" />
    </fieldset>  
    </div>
    <img id="_chatimage" class="chat" src="./img/chat.png" />
    
    <script>
    $(".chat").on({
        "click" : function() {
            if ($(this).attr("src") == "./img/chat.png") {
                $(".chat").attr("src", "./img/chathide.png");
                $("#_chatbox").css("display", "block");
            } else if ($(this).attr("src") == "./img/chathide.png") {
                $(".chat").attr("src", "./img/chat.png");
                $("#_chatbox").css("display", "none");
            }
        }
    });
	</script> 

	
<!-- End page content -->
</div><%-- 
<jsp:include page="footer.jsp"></jsp:include> --%>
</body>
</html>