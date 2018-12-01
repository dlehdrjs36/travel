var from;
var to;

$(document).ready(function() {	

	$("#btn6").click(function swap_content(){
		var tmp = document.getElementById('txt5').value;
		document.getElementById('txt5').value = document.getElementById('txt6').value;
		document.getElementById('txt6').value = tmp;
	});
	
	$("#btn5").click(function() {
		if (!$("#txt5").val()) {
			alert("출발공항을 입력해 주세요.");
			return false; 
		}else if(!$("#txt6").val()){
			alert("도착공항을 입력해 주세요.");
			return false; 
		}
		else {
			getAirLine($("#txt5").val(),$("#txt6").val());
			$(".dropdown4-content.centered").css("display", "block");			
		}		
	});
});

function getAirLine(from , to) {

	console.log(from + " " + to);
	$.ajax({
		url : "https://api.flightstats.com/flex/ratings/rest/v1/jsonp/route/"+ from+"/"+to+"?appId=13c542ec&appKey=a0953c87ff93708450f70c95f9386cdc&extendedOptions=languageCode:ko",
		dataType: 'jsonp',
		jsonpCallback: "callback",
		success : function(datas) {
			console.log(datas);
			
			var dataSet = [];
			var airline;
			
			for (var i = 0 ; i< datas.ratings.length ; i++){
				for(var j = 0 ; j < datas.appendix.airlines.length ; j++){
					if(datas.ratings[i].airlineFsCode == datas.appendix.airlines[j].fs){	
						
						airline = datas.appendix.airlines[j].name;							
					}
				}
				var dataArr = [];
				dataArr.push(datas.ratings[i].departureAirportFsCode); //출발지						
				dataArr.push(datas.ratings[i].arrivalAirportFsCode); //도착지
				dataArr.push(datas.ratings[i].airlineFsCode + datas.ratings[i].flightNumber); //비행기번호
				dataArr.push(airline); //항공사
				dataArr.push(datas.ratings[i].allOntimeStars);
				dataArr.push(datas.ratings[i].allDelayStars);
				dataArr.push(datas.ratings[i].cancelled);
				
				var allStars = datas.ratings[i].allStars;
				var intAllStars = parseInt(allStars); //3.2 면 3만 추출
				var restAllStars = allStars%1;
				var tag="";
				for (var k = 0 ; k < 5 ; k++){
					if(intAllStars > k){
						tag += "<i class='fas fa-star starColor'></i>";
					}
					else{
						if(0.5 <= restAllStars && restAllStars != 0){
							tag += "<i class='fas fa-star-half-alt starColor'></i>";
							restAllStars=0;
						}else{
							tag += "<i class='far fa-star starColor'></i>";
						}						
					}
				}			
				dataArr.push(datas.ratings[i].allStars.toFixed(2));
				dataArr.push(tag);
				dataSet.push(dataArr);
				
				/*"<i class='fas fa-star-half-alt'></i>"*/
			}
			
			$('#airportRank').DataTable({
				destroy: true,
				data: dataSet,
				columns: [
					{ title: "From" },
					{ title: "To" },
					{ title: "FlightNumber" },
					{ title: "AirLines" },					
					{ title: "정시 출발" },
					{ title: "지연 출발" },
					{ title: "결항 횟수" }, 
					{ title: "총점" },
					{ title: "<i class='far fa-star'></i>" , width:100}
					]
			});
				
/*			var dataSet = [];

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
			});	*/				
		}
	});
}

