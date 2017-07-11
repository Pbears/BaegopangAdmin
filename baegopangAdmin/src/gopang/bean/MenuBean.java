package gopang.bean;

public class MenuBean {
	private String menuname;
	private String brandno;
	private int price;
	private String info;
	private String picture;

	public MenuBean() {
		super();
	}

	@Override
	public String toString() {
		return "MenuBean [menuname=" + menuname + ", brandno=" + brandno + ", price=" + price + ", info=" + info
				+ ", picture=" + picture + "]";
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public MenuBean(String menuname, String brandno, int price, String info, String picture) {
		super();
		this.menuname = menuname;
		this.brandno = brandno;
		this.price = price;
		this.info = info;
		this.picture = picture;
	}

}
