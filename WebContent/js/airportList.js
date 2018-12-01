var from;
var to;
var fromdate;
var todate;
var num;
var seat;


function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function reserv(param1,param2,param3,param4,param5,param6,param7,param8) {
f = param1;
t = param2;
fromdate = param3;
todate = param4;
num = param5;
seat = param6;
fromName = param7;
toName = param8;
console.log(f+" "+t+ " "+fromdate+ " "+todate+ " "+num+ " "+seat+ " "+fromName+ " "+ toName);
}

$(document).ready(function() {	
		/*getAirLine($("#txt1").val(),$("#txt2").val(),$("#txt3").val());*/
	
/*	$(".dropdown3-content.centered").on("click", function(){
		alert("hhhh")
		$(".dropdown3-content.centered").css("display", "none");
	})*/
		$("#btn").click(function() {
			if (!$("#txt1").val()) {
				console.log($("#txt1").val());
				alert("출발공항을 입력해 주세요.");
				return false; 
			}else if(!$("#txt2").val()){
				alert("도착공항을 입력해 주세요.");
				return false; 
			}
			else if ( !$("input[name=fromdate]").val()) {
				alert("출발일을 선택해주세요.");
				return false;
			}
			else if ( !$("input[name=todate]").val()) {
				alert("도착일을 선택해주세요.");
				return false;
			}
			else if ( $("input[name=todate]").val() < $("input[name=fromdate]").val() ) {
		    	alert("도착일이 출발일보다 빠릅니다.");
		    	return false;
		    } 
			else if ( $(".num").val() == 0 ) {
		    	alert("구매표 개수를 정하세요.");
		    	return false;
		    }   	   
			else{
				$(function() {						
						var nameReg = /[가-힣]$/;
						var fromAddress = $("#fromName").val();
						var toAddress = $("#toName").val();
						var addressArray = [ fromAddress, toAddress ];
						var geocoder = new google.maps.Geocoder();

						var code;		
						for (var i = 0; i < 2; i++) {
							//alert(addressArray[i]);
							geocoder.geocode({ 'address' : addressArray[i] }, (function(i) { return function(results, status) {
								/*  geocoder.geocode({'address': addressArray[i]}, function(results, status) {*/
								//alert("if밖");
								if (status == google.maps.GeocoderStatus.OK) {
									//alert("if안");	
									results[0].geometry.location;					

									for (var j=0; j<results[0].address_components.length; j++) {
										for (var b=0;b<results[0].address_components[j].types.length; b++) {

											if (results[0].address_components[j].types[b] == "country") {
												var city= results[0].address_components[j];
												code = city.short_name;
												break;
											}
										}
									}					

									var lat = results[0].geometry.location.lat();
									var lng = results[0].geometry.location.lng();

									if (i == 0) {					
										$("#fromLatitude").val(lat);
										$("#fromLongitude").val(lng);
										$("#fromCountryCode").val(code);
									}
									if (i == 1) {
										$("#toLatitude").val(lat);
										$("#toLongitude").val(lng);
										$("#toCountryCode").val(code);
									}
									
									if ($("#fromLatitude").val() != "" && $("#toLatitude").val() != "") {
										/*MarkMap.submit();*/										
										bing.submit();
									}			
								}
							};
							})(i));			
						}
				});

			}
		
		});
	
		$("#btn2").click(function(){
			var tmp = document.getElementById('txt1').value;
			document.getElementById('txt1').value = document.getElementById('txt2').value;
			document.getElementById('txt2').value = tmp;
		});
	
		/*$("#txt3").keyup(function(e) {
			if (e.keyCode == 13)
			getAirLine($("#txt1").val(),$("#txt2").val(),$("#txt3").val());
		});*/
	});
	
	function getAirLine(from , to , date) {
		var price;		
		
		console.log(from + to + date);
		$.ajax({
				url : "https://api.flightstats.com/flex/schedules/rest/v1/jsonp/from/"+from+"/to/"+to+"/departing/"+date+"?appId=13c542ec&appKey=a0953c87ff93708450f70c95f9386cdc&extendedOptions=languageCode:ko",
				/*dataType: 'json',*/
				dataType: 'jsonp',
			    jsonpCallback: "myCallback",			    
				success : function(datas) {
					console.log(datas);
					var dataSet = [];
					var src;
					
					for (var i = 0; i < datas.scheduledFlights.length; i++) {
						for(var j = 0 ; j < datas.appendix.airlines.length ; j++){
				        	if(datas.scheduledFlights[i].carrierFsCode == datas.appendix.airlines[j].fs){
				        		airlines = datas.appendix.airlines[j].name;
				        		src = "./img/"+airlines+".jpg";
							}
				        } 
						var dataArr = [];
						//임의대로 가격 설정부분.
						price = Math.floor(Math.random() * 900000)+50000;
						price1 = numberWithCommas(price);					
												
						dataArr.push(datas.scheduledFlights[i].departureAirportFsCode);
						dataArr.push(datas.scheduledFlights[i].departureTime.substring(11,16));
						dataArr.push(datas.scheduledFlights[i].arrivalAirportFsCode);
						dataArr.push(datas.scheduledFlights[i].arrivalTime.substring(11,16));
						dataArr.push(datas.scheduledFlights[i].carrierFsCode + datas.scheduledFlights[i].flightNumber);
	 					dataArr.push("<img src='"+src+"'/>"+airlines);	
						dataArr.push(price1);	
											
						dataArr.push("<a href='AirportReservation.al?from="+f+
								"&to="+t+
								"&fromdate="+fromdate+
								"&todate="+todate+
								"&num="+num+
								"&seat="+seat+								
								"&departureTime="+datas.scheduledFlights[i].departureTime.substring(11,16)+								
								"&arrivalTime="+datas.scheduledFlights[i].arrivalTime.substring(11,16)+
								"&airLine="+datas.scheduledFlights[i].carrierFsCode + datas.scheduledFlights[i].flightNumber+
								"&airCode="+airlines+
								"&fromName="+fromName+
								"&toName="+toName+
								"&price="+price+"'>예약</a>");				
						console.log(dataArr);
						dataSet.push(dataArr);		
					}
					
					$('#realTime').DataTable({
						destroy: true,
				        data: dataSet,
				        columns: [
				            { title: "From" },
				            { title: "Depart.Time" },
				            { title: "To" },
				            { title: "Arrial.Time" },
				            { title: "AirCode" },
				            { title: "AirLine" },
				            { title: "price" }, 
				            { title: "예약" }
						]
					});					
				}
			});
		}
