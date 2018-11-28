// 예약 정보 체크
function check() {
	// 이름이 한글인지 체크
	var nameReg = /[a-zA-Z]{1,10}$/;
	var nameReg2 = /[a-zA-Z]{1,30}$/;
	// 휴대전화가 형식에 맞게 입력되었는지 체크
	var phoneReg = /^\d{3}-\d{4}-\d{4}$/;
	// 이메일 체크
	var emailReg = /^[a-zA-Z][0-9a-zA-Z]*@[a-zA-Z]+(\.[a-zA-Z]{3})$/;
	
	if ( !$("input[name=성]").val() ) {
    	alert("성을 입력해주세요.");
    	$("input[name=성]").focus();
    	return false;
    } 
	if(!nameReg.test($("input[name=성]").val())) {
		alert("성이 유효하지 않습니다.");
		$("input[name=성]").focus();
		return false;
	}

	if ( !$("input[name=이름]").val() ) {
    	alert("이름을 입력해주세요.");
    	$("input[name=이름]").focus();
    	return false;
    } 
	if(!nameReg2.test($("input[name=이름]").val())) {
		alert("이름이 유효하지 않습니다.");
		$("input[name=이름]").focus();
		return false;
	}
	
	if ( !$("input[name=휴대전화]").val()) {
		alert("휴대전화를 입력해 주세요.");
		$("input[name=휴대전화]").focus();
		return false;
	}
	if(!phoneReg.test($("input[name=휴대전화]").val())) {
		alert("휴대전화가 유효하지 않습니다.");
		$("input[name=휴대전화]").focus();
		return false;
	}
	if ( !$("input[name=이메일]").val()) {
		alert("이메일을 입력해주세요.");
		$("input[name=이메일]").focus();
		return false;
	}
	if(!emailReg.test($("input[name=이메일]").val())) {
		alert("이메일이 유효하지 않습니다.");
		$("input[name=이메일]").focus();
		return false;
	}
       	   
}