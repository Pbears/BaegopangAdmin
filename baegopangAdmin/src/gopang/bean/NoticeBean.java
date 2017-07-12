package gopang.bean;

public class NoticeBean {
	private String no;
	private String adminId;
	private String title;
	private String info;
	private String regdate;

	public NoticeBean() {
		super();
	}

	public NoticeBean(String no, String adminId, String title, String info, String regdate) {
		super();
		this.no = no;
		this.adminId = adminId;
		this.title = title;
		this.info = info;
		this.regdate = regdate;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "NoticeBean [no=" + no + ", adminId=" + adminId + ", title=" + title + ", info=" + info + ", regdate="
				+ regdate + "]";
	}

}
