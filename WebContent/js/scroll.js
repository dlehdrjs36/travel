$(document).ready(function(){
        
    $("#_chatimage").hide(); // 탑 버튼 숨김
    $(function () {
            try{  
		        $(window).scroll(function () {
		            if ($(this).scrollTop() > 100) { // 스크롤 내릴 표시
		                $('#_chatimage').fadeIn();
		            } else {
		                $('#_chatimage').fadeOut();
		            }
		        });
	        }catch(e){
	        console.log(e);
        }
    }); 
});