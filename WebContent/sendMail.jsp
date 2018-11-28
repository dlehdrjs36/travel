<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css"	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<script>
	$(function() {
		$("#btn").click(function() {
			var $html = $(".note-editable.card-block").html();
/* 			console.log("start")
			console.log($html);
			$("#showResult").html($html); */

			$.ajax({
				url : "./SendMail?action=sendMail",
				data : {
					contents : $html
				},
				type : "post",
				success : function(result) {
					console.log("result======"+result);
					console.log("$html======"+$html);
					
			/* 		$('#view').html(http://mail3.nate.com/#list/?pop3id=M&page=1&mboxid=60); */
					
					  var iframe = document.getElementById("myFrame");
					  var elmnt = iframe.contentWindow.document.getElementsByTagName("H1")[0];
					  elmnt.style.display = "none";					
				}
			});// end of ajax
		});
	});
</script>
<style>
.dropdown-content {   
    position: absolute;
    background-color: #f9f9f9;
    width: 80%;
    margin-left: 10%;
    margin-right: 10%;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    padding: 12px 16px;
}
</style>
</head>
<body>

<div style="height:5%;">
	<jsp:include page="header.jsp" />
</div>
  
<br><br><br><br>
 <div class="dropdown-content">
	<div id="summernote"></div>
	<button id="btn" onclick="alert('메일 전송완료!')">메일 보내기</button> 
	<br><br><br>
	<iframe id="myFrame" src="https://mail3.nate.com/#list/?pop3id=M&page=1&mboxid=60" style="height:470px;width:100%"></iframe> 
</div>
	<script>
		$('#summernote').summernote({
			placeholder : 'Hello bootstrap 4',
			tabsize : 2,
			height : 250,
			maxHeight: 250
		});
	</script>
	
</body>
</html>
