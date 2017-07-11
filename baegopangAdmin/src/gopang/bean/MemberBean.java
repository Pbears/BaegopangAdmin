package gopang.bean;

public class MemberBean {
	private String id;
	private String pw;
	private String name;
	private String address;
	private String tel;
	private String gender;
	private String birth;
	private int pang;

	public MemberBean() {
		super();
	}

	public MemberBean(String id, String pw, String name, String address, String tel, String gender, String birth,
			int pang) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.address = address;
		this.tel = tel;
		this.gender = gender;
		this.birth = birth;
		this.pang = pang;
	}

	public int getPang() {
		return pang;
	}

	public void setPang(int pang) {
		this.pang = pang;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", pw=" + pw + ", name=" + name + ", address=" + address + ", tel=" + tel
				+ ", gender=" + gender + ", birth=" + birth + ", pang=" + pang + "]";
	}

}
