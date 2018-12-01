//var iata = ['ICN','GMP','PUS','CJU','HKG','TPE','MFM','SHA','PEK','TAO','NRT','SIN','DMK','MNL','KUL','HAN','LCY','BVA','CIA','LAX','JFK','SFO'];
var iata = ['ICN','GMP','PUS','CJU','HKG','TPE','MFM','SHA','PEK','TAO','NRT','SIN','DMK','MNL','KUL','HAN','LCY','BVA','PRG','LAX','JFK','SFO'];


$(function(){ 
	$(".dia_bt").click(function(){ //dia_bt라는 아이디를 클릭했을 때
		$(".dropdown-content").css("display","block");			
			$(".contury").click(function(){ 			
				$(".dropdown-content").css("display","none");	
				var i = $(".contury").index(this);		 // 클래스이름이 contury인것의 인덱스 알아오기	
				console.log($(".contury").index(this));								
				$("input[name=from]").val(iata[i]);	
		});
	});	
});
$('html').click(function(e) {
	if(!$(e.target).hasClass("area")) { 
		$('.dropdown-content').hide();
		}
}); 



$(document).ready(function() {
	$("#btn3").click(function() {
		
		
		if (!$("#txt4").val()) {
			alert("날씨를 검색할 공항을 입력해주세요.");
			return false; 
		}
		else {
		getAirLine1($("#txt4").val());
		$('#dropdown3-hide').css("display","block");
		}
	});	 
});

function getAirLine1(from) {
	$.ajax({
		url : "https://api.flightstats.com/flex/weather/rest/v1/jsonp/metar/"
				+ from
				+ "?appId=13c542ec&appKey=a0953c87ff93708450f70c95f9386cdc",
		dataType : 'jsonp',
		jsonpCallback: "myCallback",
		success : function(datas) {
			var dataSet = [];
			var name;
			var city;
			var latitude;
			var longitude;
			var map;
			var value;
			var temperatureCelsius;
			var speedKnots;
			var iConArray = "https://maps.google.com/mapfiles/ms/micons/yellow-dot.png";			
			var markerArray;
			
			function addMarker() {
				var marker = new google.maps.Marker({
					position : markerArray,
					animation : google.maps.Animation.BOUNCE,
					map : map,
					draggable : false,
					icon : iConArray
				});
				// markers.push(marker);

				var infowindow = new google.maps.InfoWindow({
					content : name
				});

				google.maps.event.addListener(marker, 'click', function() {
					infowindow.open(map, marker);
				});
			}

			name = datas.appendix.airports[0].name;
			city = datas.appendix.airports[0].city;
			latitude = datas.appendix.airports[0].latitude;
			longitude = datas.appendix.airports[0].longitude;			
			markerArray = new google.maps.LatLng(latitude, longitude);
			console.log("위도"+latitude+"경도"+longitude)
			temperatureCelsius = datas.metar.temperatureCelsius;
			speedKnots = datas.metar.conditions.wind.speedKnots;
			document.getElementById("name").innerHTML = "공항 : " + name;
			document.getElementById("city").innerHTML = "도시 : " + city;
			document.getElementById("temperatureCelsius").innerHTML = "기온 : "
					+ temperatureCelsius;
			document.getElementById("speedKnots").innerHTML = "풍속 : "
					+ speedKnots + "m/s";
			for (var i = 0; i < datas.metar.tags.length; i++) {
				if (datas.metar.tags[i].key == "Prevailing Conditions") {
					value = datas.metar.tags[i].value;
				}
			}
			console.log(value);
			if(typeof value == "undefined"){document.getElementById("weather").src = "./img/notImage.png";}
			document.getElementById("weather").src = "./img/" + value + ".png";

			$(function() {
				var x = function(a, b) {
					var mapOptions = {
						zoom : 12,
						zoomControl : true,
						streetViewControl : false,
						draggable : true,
						mapTypeId : google.maps.MapTypeId.ROADMAP,
						center : new google.maps.LatLng(a, b)
					};
					map = new google.maps.Map(document.getElementById('map'),mapOptions);
					
					addMarker();
				}
				google.maps.event.addDomListener(window, 'load', x(latitude,longitude));
			});
		}
	});
}
