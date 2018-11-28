<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/ReservationCheck.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/main.js" type="text/javascript"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- JQuery 호출하기 위한 링크 선언 -->

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/airport.css" />
<%
	String id = (String) session.getAttribute("id");
%>

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
	height: 110%;
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
	<c:if test="${check==1}">
		<script>alert("로그인후 이용 가능합니다."); 
		location.href="./AirportMain.al";
		</script>
	</c:if>
	<div>
		<jsp:include page="../header.jsp" />
	</div>
	<div class="img">
		<div class="img-cover"></div>		
		<div class="font content"
			style="max-width: auto; margin-left: 210px; margin-top: 0px; margin-bottom: 70px;">
			<BR>
			<table class="bor tablesun" style="background-color: #EFEFFF; opacity: 0.7; margin-top: 40px;">
				<tr>
					<td colspan="12" width="1200px" class="bor-bot"
						style="padding-top: 20px;">출발지 : ${from}
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 도착지 : ${to}</td>
				</tr>
				<tr>
					<td colspan="4"
						style="padding-top: 20px; padding-left: 20px; padding-right: 20px;">출발날짜
						: ${fromdate}<br>항공기번호 : ${al}
					</td>
					<td colspan="1" style="padding-top: 20px;">성인 : ${num}명, 좌석 :
						${seat}<br>가격 : ${price}
					</td>
					<td colspan="1" style="padding-top: 20px;">총금액 : ${TotalPrice}</td>
				</tr>
				<tr>
					<td colspan="4" style="padding-top: 20px;">항공사 : ${ac}</td>
					<td
						style="padding-top: 20px; padding-right: 20px; padding-left: 20px;">출발시간
						: ${fromdate}/${dt}</td>
					<td
						style="padding-top: 20px; padding-right: 20px; padding-left: 20px;">도착시간
						: ${fromdate}/${at}</td>
					<!-- todate 오는날짜-->
				</tr>
			</table>
		</div>
		<div style="max-width: auto; margin-top: 50px; margin-left: 210px;">
			<form class="font tr td content" action="./AirportPayment.al"
				onsubmit="return check()">
				<table class="tablesun" border="2px solid red"
					style="padding-bottom: 50px; background-color: #EFEFEF; opacity: 0.8;">
					<tr>
						<td width="665px"><br>Last Name (성)</td>
						<td width="665px"><br>First Name (이름)</td>
						<td width="165px"><br>국적</td>
					</tr>
					<tr>
						<td
							style="padding-top: 20px; padding-bottom: 20px; padding-left: 20px;">
							<!-- 신규 파란테두리 parante부분 클래스 추가 -------------------------------------------------------- -->
							<input class="parante" type="text" placeholder="예:HONG" name="성" maxlength="10">
						</td>
						<td>
							<input class="parante" type="text" placeholder="예:GILDONG" name="이름" maxlength="30">
						</td>
						
							<!-- ---------------------------------------------------------------------------------------------- -->
						<td style="padding-right: 20px;"><select
							style="width: 120px; height: 67px;" name="contury">
								<option value="한국" selected>한국</option>
								<option value="일본">일본</option>
								<option value="중국">중국</option>
						</select></td>
					</tr>
					<tr>
						<td colspan="1">Phone (휴대전화)</td>
						<td colspan="1">Email (이메일)</td>
						<td></td>
					</tr>
					<tr>
						<td
							style="padding-top: 20px; padding-bottom: 20px; padding-left: 20px;">
							<!-- 신규 추가 변경 parante 파란테두리부분 ------------------------------------------------------- -->
							<input class="parante" type="text" placeholder="예:010-1234-5678" name="휴대전화"
							value="${dto.phone}"></td>
						<td colspan="1"><input class="parante" type="text"
							placeholder="예:gildong@naver.com" name="이메일" value="${dto.email}">
							<!-- ------------------------------------------------------------------------------------------ -->
						<td></td>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="right"><button type="submit"
								class="button button3"
								style="width: 200px; margin-right: 20px; margin-bottom: 20px;">예약</button></td>
					</tr>
				</table>
				
				<input type="hidden" name="구매자주소" value="${dto.address}"> <input
					type="hidden" name="출발지" value="${from}"> <input
					type="hidden" name="도착지" value="${to}"> <input
					type="hidden" name="좌석유형" value="${seat}"> <input
					type="hidden" name="출발날짜" value="${fromdate}"> <input
					type="hidden" name="비행기번호" value="${al}"> <input
					type="hidden" name="구매한표개수" value="${num}"> <input
					type="hidden" name="구매표개당가격" value="${price}"> <input
					type="hidden" name="총가격" value="${TotalPrice}"> <input
					type="hidden" name="항공사이름" value="${ac}"> <input
					type="hidden" name="출발시간" value="${fromdate}/${dt}"> <input
					type="hidden" name="도착시간" value="${fromdate}/${at}">

			</form>
		</div>
	</div>
</body>
</html>