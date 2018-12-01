$(document).ready(function() {
	var latitude;
	var longitude;
	var map;
	var iterator = 0;
	var iConArray = [];
	var markerArray = []; // 마커들을 저장하는 배열
	var polylineArray = []; // 그릴 경로를 저장하는 배열
	var log;
	var lat;
	var image;
	var name;
	
	getLocation();

	function getLocation() {
		console.log("getLocation() 호출");
		if (navigator.geolocation) { // GPS를 지원하면
			navigator.geolocation.getCurrentPosition(function(position) {

				console.log("현재 위치 값 가져옴");
				latitude = position.coords.latitude;
				longitude = position.coords.longitude;				
				////////////////////////
				$.ajax({
					url: "https://api.flightstats.com/flex/airports/rest/v1/jsonp/withinRadius/" + longitude + "/" + latitude + "/30?appId=13c542ec&appKey=a0953c87ff93708450f70c95f9386cdc",
					/*dataType: 'json',*/
					dataType: 'jsonp',
					jsonpCallback: "myCallback",
					success: function(datas) {
						console.log(datas);										
						console.log(datas[0].iata);
						image = datas[0].iata;
						/*image = datas.[[0]].iata;*/
						
						name = datas[0].name;

						document.getElementById("airport").src = "./img/"+image+".jpg";
						document.getElementById("airportName").innerHTML = "공항 : "+ name;
						
						console.log("latitude : "+ latitude + " longitude : "+longitude);
						console.log("공항이름=========="+name);

						iConArray[0] = "https://maps.google.com/mapfiles/ms/micons/yellow-dot.png";
						iConArray[1] = "https://maps.google.com/mapfiles/ms/micons/yellow-dot.png";

						var airportlatitude = datas[0].latitude;
						var airportlongitude = datas[0].longitude;

						// marker를 찍을 위도,경도
						markerArray[0] = new google.maps.LatLng(latitude, longitude);
						markerArray[1] = new google.maps.LatLng(airportlatitude, airportlongitude);
						// 경로를 표시한 위도,경도
						polylineArray[0] = new google.maps.LatLng(latitude, longitude);
						polylineArray[1] = new google.maps.LatLng(airportlatitude, airportlongitude);
						// center 화면을 구성하는 lat,log
						lat = (latitude + airportlatitude)/2;
						log = (longitude + airportlongitude)/2;						

						console.log("airportlatitude : " + airportlatitude +" airportlongitude : " + airportlongitude);
						
						$(function() {							
							var x = function(lat,log) {
								var mapOptions = {
										zoom: 12,
										zoomControl: true,
										streetViewControl: false,
										draggable: true,
										mapTypeId: google.maps.MapTypeId.ROADMAP,
										center: new google.maps.LatLng(lat, log)
								};
								console.log("맵 생성");
								map = new google.maps.Map(document.getElementById('map1'), mapOptions);		

								for (var i = 0; i < markerArray.length; i++) {
									console.log("addMarker() 호출");
									addMarker();
								}
								addPolyline();								
							}
							google.maps.event.addDomListener(window, 'load', x(lat,log));
						});						

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
						//마커 추가
						function addMarker() {
							var marker = new google.maps.Marker({
								position : markerArray[iterator],
								animation : google.maps.Animation.BOUNCE,
								map : map,
								draggable : false,
								icon : iConArray[iterator]
							});
							// markers.push(marker);

							google.maps.event.addListener(marker, 'click', function() {
								infowindow.open(map, marker);
							});
							
							iterator++;							
							console.log("addMarker iterator " + iterator);
						}	
						
						console.log(iterator);
						},
						error : function(xhr,aaa,bbb){
							console.log(xhr.status);
						}
				});
				////////////////////////
			}, function(error) {
				console.log(error);
			}, {
				enableHighAccuracy: false,
				maximumAge: 0,
				timeout: Infinity
			});
		} else {
			alert('GPS를 지원하지 않습니다');
		}
	}
});


		
