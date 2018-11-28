/**
 * 구글맵 위도 경도 계산.
 */
$(function() {
	$("#getBtn").on("click", function() {
		var nameReg = /[가-힣]$/;
		var fromAddress = $("#fromAddress").val();
		var toAddress = $("#toAddress").val();
		var addressArray = [ fromAddress, toAddress ];
		var geocoder = new google.maps.Geocoder();

		$("#fromName").val(fromAddress);
		$("#toName").val(toAddress);
		
/*		if (fromAddress == "") {
			alert("출발지를 입력하세요");
			return false;
		}
		if (!nameReg.test(fromAddress)) {
			alert("출발지를 올바른 단어로 입력하세요(한글)");
			return false;
		}
		if (toAddress == "") {
			alert("도착지를 입력하세요");
			return false;
		}
		if (!nameReg.test(toAddress)) {
			alert("도착지를 올바른 단어로 입력하세요(한글)");
			return false;
		}		
*/
		var code;
		for (var i = 0; i < 2; i++) {
			geocoder.geocode({ 'address' : addressArray[i] }, (function(i) { return function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					
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
					// 콜백함수의 결과로 동작시키기위해서 
					if ($("#fromLatitude").val() != "" && $("#toLatitude").val() != "") {
						MarkMap.submit();
					}
				}
			};
			})(i));
		}
		console.log(i);
	});
});
