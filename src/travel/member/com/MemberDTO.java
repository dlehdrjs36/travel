package travel.member.com;

public class MemberDTO {
	private String id;
	private String pw;
	private String phone;
	private int gender;
	private String address;
	private String name;
	private String email;
	private String member_date;

	public MemberDTO() {

	}

	public MemberDTO(String id, String pw, String phone, int gender, String address, String name, String email) {

		this.id = id;
		this.pw = pw;
		this.phone = phone;
		this.gender = gender;
		this.address = address;
		this.name = name;
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMember_date() {
		return member_date;
	}

	public void setMember_date(String member_date) {
		this.member_date = member_date;
	}

}
