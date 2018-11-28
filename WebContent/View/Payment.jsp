<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/airport.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--  결제api -->
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="<%=request.getContextPath()%>/js/Payment.js" type="text/javascript"></script>
<!--  결제api -->
<title>결제</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Jua');
.font {
	font-family: 'Jua', sans-serif;
	font-size: 40px;
	text-align: center;
}

.bor { /* table 선 제거  */
	border: 0px;
}

.tablesun { /* table 선 한줄적용  */
	border-collapse: collapse;
}

.tr, td {
	border: 0px;
}

.bor-bot { /* 출발지, 도착지 table 아래선 적용  */
	border-bottom: 3px solid red;
}

.img { /* 배경화면 조절 */
	position: relative;
	background: url('./w3images/비행기1.jpg');
	height: 100%;
	width: 100%;
	background-size: cover;
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	/* font-size: 16px; */
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.button3 {
	background-color: white;
	color: red;
	border: 3px solid #f44336;
}

.button3:hover {
	background-color: #f44336;
	color: white;
}

.img-cover { /* 배경 반투명 커버부분 */
	position: absolute;
	opacity: 0.4;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.2); /*검은색 배경에 투명도 지정  */
	z-index: 1; /*배경이미지 보다 앞에 있어야 하므로 z-index지정  */
}

.content { /* 배경 위 글씨 삽입 부분 */
	position: relative;
	/* top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);  */
	/* font-size: 3rem; */
	color: black;
	z-index: 2;
	/* text-align: center; */
	/* font-family: "Arvo|Baloo+Tammudu", sans-serif; */
}
</style>
</head>
<body>
	<script>
		value('${dto.TOTAL_PRICE}', '${dto.EMAIL}', '${dto.PHONE}',
				'${dto.LNAME}+${dto.FNAME}', '${dto.ADDRESS}')
	</script>
	<div>
		<jsp:include page="../header.jsp" />
	</div>
	<div class="img">
		<div class="img-cover"></div>
		<div class="font content"
			style="max-width: auto; margin-left: 100px; margin-top: 0px; margin-bottom: 70px;">
			<BR>
			<table class="bor tablesun"
				style="background-color: #EFEFFF; opacity: 0.7;">
				<tr>
					<td colspan="12" width="1200px" class="bor-bot"
						style="padding-top: 20px;">출발지 : ${dto.DEPARTURE}
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 도착지 : ${dto.ARRIVAL}</td>				
				</tr>
				<tr>
					<td colspan="4"
						style="padding-top: 20px; padding-left: 20px; padding-right: 20px;">출발날짜
						: ${dto.DEPARTURE_DATE}<br>항공기번호 : ${dto.FLIGHT_NUMBER}
					</td>
					<td colspan="1" style="padding-top: 20px;">성인 :
						${dto.TICKET}명, 좌석 : ${dto.SEAT}<br>가격 : ${dto.PRICE}
					</td>
					<td colspan="1" style="padding-top: 20px;">총금액 :
						${dto.TOTAL_PRICE}</td>
				</tr>
				<tr>
					<td colspan="4" style="padding-top: 20px;">항공사 :
						${dto.AIRLINE}</td>
					<td style="padding-top: 20px;">출발시간 : ${dto.DEPARTURE_TIME}</td>
					<td
						style="padding-top: 20px; padding-right: 20px; padding-left: 20px;">도착시간
						: ${dto.ARRIVAL_TIME}</td>				
				</tr>		
				<tr>
					<td colspan="12" class="bor-bot" style="padding-top: 60px;">
						결제자 정보(ID:${dto.ID})</td>
				</tr>
				<tr>
					<td colspan="4" style="padding-top: 20px;">First Name(이름) :
						${dto.FNAME}</td>

					<td
						style="padding-top: 20px; padding-right: 20px; padding-left: 20px;">
						Last Name(성) : ${dto.LNAME}</td>
					<td style="padding-top: 20px;">국적 : ${dto.NATIONALITY}</td>
				</tr>
				<tr>
					<td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone (휴대전화) :
						${dto.PHONE}</td>
					<td colspan="2" style="padding-right: 320px;">Email (이메일) :
						${dto.EMAIL}</td>
				</tr>
				<tr>
					<td colspan="12" style="padding-top: 20px;">주소 :
						${dto.ADDRESS}</td>
				</tr>
				<tr>
					<td colspan="12" align="right"><button id="btn"
							class="button button3"
							style="width: 200px; margin-right: 20px; margin-bottom: 20px;">결제</button></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>