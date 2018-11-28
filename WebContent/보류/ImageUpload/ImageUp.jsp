<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Gaegu|Rancho"
	rel="stylesheet">
<title>이미지 업로드</title>
</head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);

.file_input label {
	position: relative;
	cursor: pointer;
	display: inline-block;
	vertical-align: middle;
	overflow: hidden;
	width: 100px;
	height: 30px;
	background: #777;
	color: #fff;
	text-align: center;
	line-height: 30px;
	font-family: 'Rancho', cursive;
}

.file_input label input {
	position: absolute;
	width: 0;
	height: 0;
	overflow: hidden;
}

.file_input input[type=text] {
	vertical-align: middle;
	display: inline-block;
	width: 400px;
	height: 28px;
	line-height: 28px;
	font-size: 15px;
	padding: 0;
	border: 0;
	border: 1px solid #777;
}

input:hover {
	text-decoration: underline;
}

a:hover {
	text-decoration: underline;
}

p {
	padding: 5px 25px 5px 25px;
	border: 1px solid lightgrey;
	display: inline;
}

tr.b {
	border-bottom: 1px solid lightgrey
}

.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
}
</style>
<body style="text-align: center">
	<jsp:include page="../header.jsp"></jsp:include>
	<br>
	<br />
	<h3 style="text-decoration: underline">Image</h3>
	<div class="centered">
		<form action="<%=request.getContextPath()%>/imageUpload.mjy" method="post" enctype="multipart/form-data">
			<table style="width: 1000px; text-align: center; border: 1px solid lightgrey;">

				<tr style="border-top: 1px solid lightgrey; height: 50px" class="b">
					<td colspan="2">&nbsp;&nbsp; Subject <input type="text"
						name="title" autofozus required size="80">
					</td>
				</tr>

				<tr style="height: 300px; text-align: center" class="b">
					<td colspan="2"><textarea name="content"
							style="width: 900px; height: 250px; resize: none;"
							placeholder="내용을 입력하세요." autofozus required style="resize: none"></textarea></td>
				</tr>
								
				<tr>
				<td>
				<input type="text"
						name="price" autofozus required size="80"></td>
						
				<td>
				<input type="text"
						name="hits" autofozus required size="80"></td>
				</tr>

				<tr style="height: 50px;" class="b">
					<td colspan="2">
					<div class="file_input">
							<label>Thumbnail
							<input type="file"
								onchange="javascript:document.getElementById('file_route').value=this.value"
								name="thumnail">
								</label> 
								<input type="text" readonly="readonly"	title="File Route" 
								id="file_route" size="50">
								<br>

							<label>Detail <input type="file"
								onchange="javascript:document.getElementById('file_route2').value=this.value"
								name="detail">
							</label> <input type="text" readonly="readonly" title="File Route"
								id="file_route2" size="50">
						</div></td>
				</tr>


			</table>
			<table style="width: 1000px; text-align: right;">
				<tr>
					<td><br/>
						<p>
							<a href="../main.jsp" style="color: grey">LIST</a>
						</p>
						<p>
							<input type="submit" value="WRITE"
								style="background-color: white; border: 0px; color: grey">
						</p>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>