<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script>
<script src="/travel/js/Addr.js"></script>

<script type="text/javascript" src="/travel/js/MemberJoinCheck.js"></script>
<script type="text/javascript" src="/travel/js/MemberIdCheck.js"></script>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="./bootstrap/js/bootstrap.min.js"></script>

<!-- JQuery 호출하기 위한 링크 선언 -->
</head>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo');
@import url('https://fonts.googleapis.com/css?family=Do+Hyeon');
@import url('https://fonts.googleapis.com/css?family=Baloo+Tammudu');
@import	url('https://fonts.googleapis.com/css?family=Arvo|Baloo+Tammudu');
@import url('https://fonts.googleapis.com/css?family=Fjalla+One');
body {
	display: table-cell;
	background: url('./w3images/san.jpg') no-repeat;
	background-size: cover;
	font-family: "Fjalla One", sans-serif;
	font-size: 20px;
	padding-right: 500px;
	margin-right: 500px;
	margin-left: 500px;
}

table {
	/* border: 1px solid green; */
	position: fixed;
	top: 150px;
	left: 700px;
	/* padding : 150px; */
	width: 500px;
	height: 450px;
	opacity: 0.8;
	background-color: #EFEFFF;
}

but {
	position: fixed;
	top: 300px;
	left: 300px;
}

td {
	padding-right: 10px;
	padding-left: 10px;
}
</style>
<body>
	<form action="MemberForm.do" method="post" name="userInfo"
		onsubmit="return checkValue()">
		<div>
			<table>
				<tr>
					<td><br>&nbsp;ID <br>
					<br></td>
					<td><br>
					<input type="text" name="id" maxlength="20" value='${id}'
						onchange="IdCheck()" class="form-control input-lg"> <c:if
							test="${check==0}">
					중복된ID가 없습니다.	
					</c:if> <c:if test="${check==1}">
					중복된ID입니다.					
					</c:if> <br></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" maxlength="20"
						value='${password}' class="form-control input-lg"></td>
				</tr>
				<tr>
					<td>Password Check</td>
					<td><input type="password" name="passwordcheck" maxlength="20"
						value='${passwordcheck}' class="form-control input-lg"></td>
				</tr>
				<tr>
					<td><br>Name<br></td>
					<td><br>
					<input type="text" name="name" maxlength="4" value='${name}'
						class="form-control input-lg"></td>
				</tr>
				<tr>
					<td><br>Gender<br></td>
					<td><br>
					<input type="radio" name="gender" value="1">Male &nbsp; <input
						type="radio" name="gender" value="2">Female</td>
					<c:if test="${gender==1}">
						<script>
							document.userInfo.gender.value = 1
						</script>
					</c:if>
					<c:if test="${gender==2}">
						<script>
							document.userInfo.gender.value = 2
						</script>
					</c:if>
				</tr>
				<tr>
					<td><br>Phone<br></td>

					<td><br> <select name="phone1" class="kal input-sm">
							<option value="010" selected>010</option>
							<option value="011">011</option>
					</select> - <input type="text" name="phone2" size="4" maxlength="4"
						value='${phone2}' class="kal input-sm"> - <input
						type="text" name="phone3" size="4" maxlength="4" value='${phone3}'
						class="kal input-sm"></td>
				</tr>
				<tr>
					<td><br>Email<br>
					<br></td>
					<td><br>
					<input type="text" name="email" value='${email}'
						class="form-control Default input"><br></td>
				</tr>
				<tr>
					<td>Address<br>
					<br>
					<br>
					<br></td>
					<td><input type="text" id="postcode" name="postcode"
						placeholder="우편번호" value='${postcode}' class="input-sm" readonly="readonly"> <input
						type="button" onclick="execDaumPostcode()" value="Post Search"><br>
						<input type="text" id="roadAddress" name="roadAddress"
						placeholder="도로명주소" value='${roadAddress}' class="form-control" readonly="readonly">
						<input type="text" id="jibunAddress" name="jibunAddress"
						placeholder="지번주소" value='${jibunAddress}' class="form-control" readonly="readonly">
						<br>
					<br>
					<br> <span id="guide" name="guide" style="color: #999"></span>
					</td>
				</tr>
			</table>
		</div>
		<br> <input type="submit" value="Join"
			class="btn btn-primary btn-lg"
			style="position: fixed; left: 885px; top: 750px">
		&nbsp;&nbsp; <input type="reset" value="Rewrite"
			class="btn btn-warning btn-lg"
			style="position: fixed; left: 980px; top: 750px"> <input
			type="hidden" name="check" value="${check}" />
	</form>
	<form action="MemberIdCheck.do" method="post" name="idCheck">
		<input type="hidden" name="id" value="" /> <input type="hidden"
			name="password" value="" /> <input type="hidden"
			name="passwordcheck" value="" /> <input type="hidden" name="name"
			value="" /> <input type="hidden" name="gender" value="" /> <input
			type="hidden" name="phone1" value="" /> <input type="hidden"
			name="phone2" value="" /> <input type="hidden" name="phone3"
			value="" /> <input type="hidden" name="email" value="" /> <input
			type="hidden" name="postcode" value="" /> <input type="hidden"
			name="roadAddress" value="" /> <input type="hidden"
			name="jibunAddress" value="" /> <input type="hidden" name="check"
			value="" />
	</form>
</body>
</html>