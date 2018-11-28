/**
 * ID 중복 체크하는부분 
 */

function IdCheck(){
	
	if ( !document.userInfo.id.value) {
		alert("ID를 입력해주십시오.");
		return false;
	}	
	var MemberForm = document.userInfo;
	var id = MemberForm.id.value;
	
	var IdCheckForm = document.idCheck;
	IdCheckForm.id.value = id;	
	
	IdCheckForm.password.value = MemberForm.password.value;
	IdCheckForm.passwordcheck.value = MemberForm.passwordcheck.value;
	IdCheckForm.name.value = MemberForm.name.value;
	IdCheckForm.gender.value = MemberForm.gender.value;
	IdCheckForm.phone1.value = MemberForm.phone1.value;
	IdCheckForm.phone2.value = MemberForm.phone2.value;
	IdCheckForm.phone3.value = MemberForm.phone3.value;
	IdCheckForm.email.value = MemberForm.email.value;
	IdCheckForm.postcode.value = MemberForm.postcode.value;
	IdCheckForm.roadAddress.value = MemberForm.roadAddress.value;
	IdCheckForm.jibunAddress.value = MemberForm.jibunAddress.value;
	IdCheckForm.check.value = MemberForm.check.value;	
	
	IdCheckForm.submit();		
}
