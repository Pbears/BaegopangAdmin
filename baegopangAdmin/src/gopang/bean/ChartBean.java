package gopang.bean;

public class ChartBean {
	private String storename;
	private String menuname;
	private String brandno;
	private String weekday;
	private String orderday;
	private String ordermonth;
	private String gender;
	private String price;
	private String amount;
	private String memberid;
	private String age;

	public ChartBean() {
		super();
	}

	public ChartBean(String storename, String menuname, String brandno, String weekday, String orderday,
			String ordermonth, String gender, String price, String amount, String memberid, String age) {
		super();
		this.storename = storename;
		this.menuname = menuname;
		this.brandno = brandno;
		this.weekday = weekday;
		this.orderday = orderday;
		this.ordermonth = ordermonth;
		this.gender = gender;
		this.price = price;
		this.amount = amount;
		this.memberid = memberid;
		this.age = age;
	}

	@Override
	public String toString() {
		return "ChartBean [storename=" + storename + ", menuname=" + menuname + ", brandno=" + brandno + ", weekday="
				+ weekday + ", orderday=" + orderday + ", ordermonth=" + ordermonth + ", gender=" + gender + ", price="
				+ price + ", amount=" + amount + ", memberid=" + memberid + ", age=" + age + "]";
	}

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}

	public String getMenuname() {
		return menuname;
	}

	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}

	public String getBrandno() {
		return brandno;
	}

	public void setBrandno(String brandno) {
		this.brandno = brandno;
	}

	public String getWeekday() {
		return weekday;
	}

	public void setWeekday(String weekday) {
		this.weekday = weekday;
	}

	public String getOrderday() {
		return orderday;
	}

	public void setOrderday(String orderday) {
		this.orderday = orderday;
	}

	public String getOrdermonth() {
		return ordermonth;
	}

	public void setOrdermonth(String ordermonth) {
		this.ordermonth = ordermonth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

}
