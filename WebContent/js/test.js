$(document).ready(function() {	
		$("#btn").click(function() {
			getAirLine($("#txt1").val(),$("#txt2").val(),$("#txt3").val());
		});

		
		$("#txt3").keyup(function(e) {
			if (e.keyCode == 13)
				getAirLine($("#txt1").val(),$("#txt2").val(),$("#txt3").val());
		});
	});


/*function callMyFunc(param) {
	var loc = "AirportList.al?" + param;
	//alert(loc);
	//console.log(loc);
	window.location.href = loc;
}*/
	
	function getAirLine(from , to , date) {
		var price;
		
		console.log(from + to + date);
		$.ajax({
				url : "https://api.flightstats.com/flex/schedules/rest/v1/json/from/"+from+"/to/"+to+"/departing/"+date+"?appId=13c542ec&appKey=a0953c87ff93708450f70c95f9386cdc&extendedOptions=languageCode:ko",
				dataType: 'json', 
				success : function(datas) {
					console.log(datas);
					var dataSet = [];
					var src;
					for (var i = 0; i < datas.scheduledFlights.length; i++) {
						for(var j = 0 ; j < datas.appendix.airlines.length ; j++){
				        	if(datas.scheduledFlights[i].carrierFsCode == datas.appendix.airlines[j].fs){
				        		airlines = datas.appendix.airlines[j].name;
				        		src = "./img/"+airlines+".jpg";
				        		
				        		console.log(src);
							}
				        } 
						var dataArr = [];
						//임의대로 가격 설정부분.
						price = Math.floor(Math.random() * 10000)+100;
						price = price.toString().substring(0,3);
						price1 = price + ",000";
						
						
						dataArr.push(datas.scheduledFlights[i].departureAirportFsCode);
						dataArr.push(datas.scheduledFlights[i].departureTime.substring(11,16));
						dataArr.push(datas.scheduledFlights[i].arrivalAirportFsCode);
						dataArr.push(datas.scheduledFlights[i].arrivalTime.substring(11,16));
						dataArr.push(datas.scheduledFlights[i].carrierFsCode + datas.scheduledFlights[i].flightNumber );
	 					dataArr.push("<img src='"+src+"'/>"+airlines);		 
	 					/* dataArr.push("<img src='../img/스페인2.jpg'/>"); */
						dataArr.push(price1);	
												
						dataArr.push("<a href='AirportList.al?departureAirportFsCode="+datas.scheduledFlights[i].departureAirportFsCode+
								"&departureTime="+datas.scheduledFlights[i].departureTime.substring(11,16)+
								"&arrivalAirportFsCode="+datas.scheduledFlights[i].arrivalAirportFsCode+
								"&arrivalTime="+datas.scheduledFlights[i].arrivalTime.substring(11,16)+
								"&airLine="+datas.scheduledFlights[i].carrierFsCode + datas.scheduledFlights[i].flightNumber+
								"&airCode="+airlines+
								"&price="+price+"'>예약</a>");			
						
						
/*						 var param = "departureAirportFsCode=" + datas.scheduledFlights[i].departureAirportFsCode
						+ "&departureTime=" + datas.scheduledFlights[i].departureTime.substring(11, 16)
						+ "&arrivalAirportFsCode=" + datas.scheduledFlights[i].arrivalAirportFsCode
						+ "&arrivalTime=" + datas.scheduledFlights[i].arrivalTime.substring(11, 16)
						+ "&carrierFsCode=" + datas.scheduledFlights[i].carrierFsCode
						+ "&flightNumber=" + datas.scheduledFlights[i].flightNumber;
						dataArr.push("<button type='button' onclick='callMyFunc(\"" + param + "\")'>예약</button>");
						dataArr.push("<input type='hidden' name='param' value='" + param + "' ></input>");
						console.log(dataArr[1]);*/
						
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
				            { title: "AirCode" },
				            { title: "price" }, 
				            { title: "reservation" }
						]
					});		
				}
			});
}