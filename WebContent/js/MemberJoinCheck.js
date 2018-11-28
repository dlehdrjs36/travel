/**
 * 회원 가입시 각각의 값 입력되어있는지 안되어 있는지 체크 & 비밀번호와 비밀번호가 일치 하는지 체크
 */
function checkValue() {
	var idReg = /^[a-zA-Z]+[a-zA-Z0-9]{5,19}$/g;

	// 이름이 한글인지 체크
	var nameReg = /[가-힣]$/;

	// 휴대전화가 형식에 맞게 입력되었는지 체크
	var phoneReg = /[0-9]{4}/;

	// 이메일 체크
	var emailReg = /^[a-zA-Z][0-9a-zA-Z]*@[a-zA-Z]+(\.[a-zA-Z]{3})$/;

	if (!document.userInfo.id.value) {
		alert("아이디를 입력하세요.");
		return false;
	}

	if (document.userInfo.check.value == "") {
		alert("ID중복을 확인하세요.");
		return false;
	}

	if (document.userInfo.check.value == 1) {
		alert("중복된 ID입니다. 다른 ID를 사용하세요");
		return false;
	}

	if (!idReg.test(document.userInfo.id.value)) {
		alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
		return false;
	}

	if (!document.userInfo.password.value) {
		alert("비밀번호를 입력하세요.");
		return false;
	}

	if (document.userInfo.password.value != document.userInfo.passwordcheck.value) {
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}

	if (!document.userInfo.name.value) {
		alert("이름을 입력하세요.");
		return false;
	}

	if (!nameReg.test(document.userInfo.name.value)) {
		alert("이름은 한글만 입력가능합니다.");
		return false;
	}

	if (!document.userInfo.gender.value) {
		alert("성별을 입력하세요.");
		return false;
	}

	if ((!document.userInfo.phone2.value) || (!document.userInfo.phone3.value)) {
		alert("휴대전화를 입력하세요.");
		return false;
	}

	if ((!phoneReg.test(document.userInfo.phone2.value))
			|| (!phoneReg.test(document.userInfo.phone3.value))) {
		alert("휴대폰번호는 숫자만 입력가능합니다.");
		return false;
	}
	if (!document.userInfo.email.value) {
		alert("이메일을 입력하세요.");
		return false;
	}
	if (!emailReg.test(document.userInfo.email.value)) {
		alert("이메일의 형식에 맞게 입력하세요.");
		return false;
	}

	if (!document.userInfo.postcode.value
			&& !document.userInfo.roadAddress.value
			&& !document.userInfo.jibunAddress.value) {
		alert("주소를 입력하세요.");
		return false;
	}
}