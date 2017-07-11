package gopang.bean;

public class StoreBean {
	private String storename;
	private String brandno;
	private String location;
	private int gpa;
	private String hours;
	private String tel;
	private int minprice;
	private String info;

	public StoreBean() {
		super();
	}

	@Override
	public String toString() {
		return "StoreBean [storename=" + storename + ", brandno=" + brandno + ", location=" + location + ", gpa=" + gpa
				+ ", hours=" + hours + ", tel=" + tel + ", minprice=" + minprice + ", info=" + info + "]";
	}

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}

	public String getBrandno() {
		return brandno;
	}

	public void setBrandno(String brandno) {
		this.brandno = brandno;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getGpa() {
		return gpa;
	}

	public void setGpa(int gpa) {
		this.gpa = gpa;
	}

	public String getHours() {
		return hours;
	}

	public void setHours(String hours) {
		this.hours = hours;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getMinprice() {
		return minprice;
	}

	public void setMinprice(int minprice) {
		this.minprice = minprice;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public StoreBean(String storename, String brandno, String location, int gpa, String hours, String tel, int minprice,
			String info) {
		super();
		this.storename = storename;
		this.brandno = brandno;
		this.location = location;
		this.gpa = gpa;
		this.hours = hours;
		this.tel = tel;
		this.minprice = minprice;
		this.info = info;
	}
}
