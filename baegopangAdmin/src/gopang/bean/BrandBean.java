package gopang.bean;

public class BrandBean {
	private String brandno;
	private String brandname;
	private String picture;

	public BrandBean() {
		super();
	}

	public BrandBean(String brandno, String brandname, String picture) {
		super();
		this.brandno = brandno;
		this.brandname = brandname;
		this.picture = picture;
	}

	public String getBrandno() {
		return brandno;
	}

	public void setBrandno(String brandno) {
		this.brandno = brandno;
	}

	public String getBrandname() {
		return brandname;
	}

	public void setBrandname(String brandname) {
		this.brandname = brandname;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	@Override
	public String toString() {
		return "BrandBean [brandno=" + brandno + ", brandname=" + brandname + ", picture=" + picture + "]";
	}

}
