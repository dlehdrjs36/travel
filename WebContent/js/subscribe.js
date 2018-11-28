// Subscribe 구독자 내용 미입력, 입력 조건 지정 스크립트
function button_click() {
	if(document.getElementById("subscribe").value == "") {
		alert("Please enter your email.");
		return false;
	}
	else {
		alert("Thank you for your subscription.");
	}
}

// contact 연락 내용 미입력, 입력 조건 지정 스크립트
function button_click1() {
	if(document.getElementById("name").value == "") {
		alert("Please enter a name.");
		return false;
	}
	else if(document.getElementById("email").value == "") {
		alert("Please enter a email.");
		return false;
	} 
	else if(document.getElementById("mess").value == "") {
		alert("Please enter a message.");
		return false;
	}
	else {
		alert("Thank you for contacting us.\nPlease wait for an answer.");
	}
}

