/**
 * 
 */
function createMap(fromName, toName, fromLatitude, toLatitude, fromLongitude, toLongitude) {
	// var markers = []; // 마커들의 위치, 아이콘,말풍선들을 담는 배열

	var contentArray = []; // 말풍선
	var iConArray = []; // 아이콘 이미지
	var iterator = 0; // 배열의 값을 순차적으로 확인하는 반복자
	var markerArray = []; // 마커들을 저장하는 배열
	var polylineArray = []; // 그릴 경로를 저장하는 배열
	var map;
	var lat;
	var lng;
	
	console.log(fromName + " " + toName + " " + fromLatitude + " " + toLatitude + " "+ fromLongitude + " "+toLongitude)
	
	// infowindow contents 배열
	contentArray[0] = fromName;
	contentArray[1] = toName;
	// marker icon 배열
	iConArray[0] = "https://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
	iConArray[1] = "https://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
	// marker를 찍을 위도,경도
	markerArray[0] = new google.maps.LatLng(fromLatitude, fromLongitude);
	markerArray[1] = new google.maps.LatLng(toLatitude, toLongitude);
	// 경로를 표시한 위도,경도
	polylineArray[0] = new google.maps.LatLng(fromLatitude, fromLongitude);
	polylineArray[1] = new google.maps.LatLng(toLatitude, toLongitude);
	
	/*
	 * 중심좌표 구하기 위도,경도 설명 위도: 양수 북위(N),음수 남위(S): -90 ~ 90 경도: 양수 동경(E),음수 서경(W) :
	 * -180 ~ 180 EX) -40.68919,-74.044655 = 남위 40.68919, 서경 74.044655
	 */
	// 받아온 위도,경도 값을 북위,남위, 동경,서경으로 구분
	// 위도 -90(남극) ~ 90(북극)
	if (fromLatitude > 0 && toLatitude > 0) {
		lat = (fromLatitude + toLatitude) / 2;
	} else if (fromLatitude < 0 && toLatitude < 0) {
		lat = (fromLatitude + toLatitude) / 2;
	} else if (fromLatitude > 0 && toLatitude < 0) {
		lat = (fromLatitude + (-toLatitude)) / 2;
	} else if (fromLatitude < 0 && toLatitude > 0) {
		lat = ((-fromLatitude) + toLatitude) / 2;
	}
	// 경도 -180 ~ 180
/*	if (fromLongitude > 0 && toLongitude > 0) {
		lng = (fromLongitude + toLongitude) / 2;
	} else if (fromLongitude < 0 && toLongitude < 0) {
		lng = (fromLongitude + toLongitude) / 2;
	} else if (fromLongitude > 0 && toLongitude < 0) {
		lng = (fromLongitude + (-toLongitude));
		if (-180 > lng || lng > 180) {
			lng = 180;
		}
	} else if (fromLongitude < 0 && toLongitude > 0) {
		lng = ((-fromLongitude) + toLongitude);
		if (-180 > lng || lng > 180) {
			lng = 180;
		}
	}*/
	var fromLon = (fromLongitude > 0) ? fromLongitude : (360 + fromLongitude); 
    var toLon = (toLongitude > 0) ? toLongitude : (360 + toLongitude);
    var Lon;
    if(fromLon - toLon > 180 || fromLon - toLon < -180)
        Lon = (fromLon + toLon) / 2 + 180;
    else
        Lon = (fromLon + toLon) / 2;
    if (Lon > 180)
        Lon = Lon - 360;
    lng = Lon;
	
	

	//맵 생성
	function initialize() {
		var mapOptions = {
			zoom : 2,
			zoomControl : false,
			streetViewControl : false,
			draggable : false,
			mapTypeId : google.maps.MapTypeId.ROADMAP,
			center : new google.maps.LatLng(lat, lng)
		};

		map = new google.maps.Map(document.getElementById('map'), mapOptions);

		for (var i = 0; i < markerArray.length; i++) {
			addMarker();
		}
		addPolyline();
	}	
	// 마커 간에 경로 긋기
	function addPolyline() {

		var lineSymbol = {
			path : google.maps.SymbolPath.FORWARD_CLOSED_ARROW
		};

		var flightPath = new google.maps.Polyline({
			path : polylineArray,
			icons : [ {
				icon : lineSymbol,
				offset : '100%'
			} ],
			geodesic : true,
			strokeColor : "#0000FF",
			strokeOpacity : 1.0,
			strokeWeight : 2
		});

		flightPath.setMap(map);
	}
	// 마커 추가
	function addMarker() {
		var marker = new google.maps.Marker({
			position : markerArray[iterator],
			animation : google.maps.Animation.BOUNCE,
			map : map,
			draggable : false,
			icon : iConArray[iterator]
		});
		// markers.push(marker);

		var infowindow = new google.maps.InfoWindow({
			content : contentArray[iterator]
		});

		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		});

		iterator++;
	}
	// 페이지가 로드될떄 initialize 실행
	google.maps.event.addDomListener(window, 'load', initialize);
}
