// 항공편 검색 체크
function check() {
	console.log($("input[name=f]").val());
	if ( !$("input[name=f]").val() ) {
    	alert("출발지를 선택해 주세요.");
    	return false;
    } 
	if ( !$("input[name=t]").val()) {
		alert("도착지를 선택해 주세요.");
		return false;
	} 
	if ( !$("input[name=fromdate]").val()) {
		alert("출발일을 선택해주세요.");
		return false;
	}
	if ( !$("input[name=todate]").val()) {
		alert("도착일을 선택해주세요.");
		return false;
	}
	if ( $("input[name=todate]").val() < $("input[name=fromdate]").val() ) {
    	alert("도착일이 출발일보다 빠릅니다.");
    	return false;
    } 
	if ( $(".num").val() == 0 ) {
    	alert("구매표 개수를 정하세요.");
    	return false;
    }   	   
}