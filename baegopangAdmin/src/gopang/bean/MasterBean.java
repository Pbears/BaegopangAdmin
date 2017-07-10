package gopang.bean;

public class MasterBean {
	private String id;
	private String pw;
	private String name;
	private String address;
	private String tel;
	private String birth;
	private String storename;
	private int point;

	public MasterBean() {
		super();
	}

	public MasterBean(String id, String pw, String name, String address, String tel, String birth, String storename,
			int point) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.address = address;
		this.tel = tel;
		this.birth = birth;
		this.storename = storename;
		this.point = point;
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

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "MasterBean [id=" + id + ", pw=" + pw + ", name=" + name + ", address=" + address + ", tel=" + tel
				+ ", birth=" + birth + ", storename=" + storename + ", point=" + point + "]";
	}

}
