<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>헤더</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/travel/js/GoogleMaplocation.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBGXKB1k8LOAYWW0KCV9G0NNupVvav0XAs"></script>

</head>
<body class="w3-light-grey" contenteditable="false">
	<!-- Header -->
	<header class="w3-display-container w3-content w3-hide-small"
		style="max-width: 1500px">
		<img class="w3-image"
			src="<%=request.getContextPath()%>/w3images/london.jpg" alt="London"
			width="1500" height="700">
		<div class="w3-display-middle" style="width: 65%">
			<div class="w3-bar w3-black">
				<button class="w3-bar-item w3-button tablink w3-red" onclick="openLink(event, 'Flight');">
					<i class="fa fa-plane w3-margin-right"></i>Flight
				</button>
			</div>

			<div id="Flight" class="w3-container w3-white w3-padding-16 myLink" style="display: block;">
				<h3>Travel the world with us</h3>

				<div class="w3-row-padding" style="margin: 0 -16px;">
					<div class="w3-half">
						<label>From</label> 
						<input class="w3-input w3-border" type="text" placeholder="Departing from" id="fromAddress" name="fromAddress">
					</div>
					<div class="w3-half">
						<label>To</label> 
						<input class="w3-input w3-border" type="text" placeholder="Arriving at" id="toAddress" name="toAddress">
					</div>
				</div>
				<p>
					<button class="w3-button w3-dark-grey bttn" id="getBtn">Search and find dates</button>
				</p>
				<form name="MarkMap" action="<%=request.getContextPath()%>/searchResultView.sv" method="get">
					<input type="hidden" id="fromName" name="fromName">
					<input type="hidden" id="toName" name="toName"> 
					<input type="hidden" id="fromLatitude" name="fromLatitude">
					<input type="hidden" id="fromLongitude" name="fromLongitude"> 
					<input type="hidden" id="toLatitude" name="toLatitude">
					<input type="hidden" id="toLongitude" name="toLongitude">
					<input type="hidden" id="toCountryCode" name="toCountryCode">
					<input type="hidden" id="fromCountryCode" name="fromCountryCode">
				</form>

			</div>
		</div>
	</header>
</body>
</html>