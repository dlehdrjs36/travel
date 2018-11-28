/**
 * 
 */
//선택된 영역이 아닌곳을 클릭하면 dropdown창이 안보이도록 함.

//var iata = ['ICN','GMP','PUS','CJU','HKG','TPE','MFM','SHA','PEK','TAO','NRT','SIN', 'DMK', 'MNL','KUL','HAN','LCY','BVA','CIA','LAX','JFK','SFO' ];

var iata = ['ICN','GMP','PUS','CJU','HKG','TPE','MFM','SHA','PEK','TAO','NRT','SIN', 'DMK', 'MNL','KUL','HAN','LCY','BVA','PRG','LAX','JFK','SFO' ];

$('html').click(function(e) {
	if(!$(e.target).hasClass("area")) { 
		$('.dropdown-content').hide();
		}
	if(!$(e.target).hasClass("area2")) { 
		$('.dropdown2-content').hide();
		} 
	}); 
// 달력 UI
$(function() {
	//$('.testDatepicker').click(function() {
		$(".testDatepicker" ).datepicker({
    	dateFormat : "yy/mm/dd",
    	dayNames : ['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
    	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        minDate: -0, 
        maxDate: "+3M"
		});
	//});
});
// dropdown창
$(function(){ 
	$(".dia_bt").click(function(){ //dia_bt라는 아이디를 클릭했을 때
		$(".dropdown-content").css("display","block");				
		$(".contury").click(function(){ 			
			$(".dropdown-content").css("display","none");	
			var i = $(".contury").index(this);			
			console.log($(".contury").index(this));							
			$("input[name=from]").val(iata[i]);	
		});
	});	
});
$(function(){ 
	$(".dia_bt2").click(function(){ 
		$(".dropdown2-content").css("display","block");	
		$(".tocontury").click(function(){ 		
			$(".dropdown2-content").css("display","none");	
			var i = $(".tocontury").index(this);			
			console.log($(".tocontury").index(this));							
			$("input[name=to]").val(iata[i]);
		});
	});
});
