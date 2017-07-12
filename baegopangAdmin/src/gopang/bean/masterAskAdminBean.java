package gopang.bean;

public class masterAskAdminBean {
	private String no;
	private String title;
	private String masterInfo;
	private String masterId;
	private String adminInfo;
	private String adminId;
	private String regdate;
	private int hit;

	public masterAskAdminBean() {
		super();
	}

	@Override
	public String toString() {
		return "masterAskAdmin [no=" + no + ", title=" + title + ", masterInfo=" + masterInfo + ", masterId=" + masterId
				+ ", adminInfo=" + adminInfo + ", adminId=" + adminId + ", regdate=" + regdate + ", hit=" + hit + "]";
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMasterInfo() {
		return masterInfo;
	}

	public void setMasterInfo(String masterInfo) {
		this.masterInfo = masterInfo;
	}

	public String getMasterId() {
		return masterId;
	}

	public void setMasterId(String masterId) {
		this.masterId = masterId;
	}

	public String getAdminInfo() {
		return adminInfo;
	}

	public void setAdminInfo(String adminInfo) {
		this.adminInfo = adminInfo;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public masterAskAdminBean(String no, String title, String masterInfo, String masterId, String adminInfo, String adminId,
			String regdate, int hit) {
		super();
		this.no = no;
		this.title = title;
		this.masterInfo = masterInfo;
		this.masterId = masterId;
		this.adminInfo = adminInfo;
		this.adminId = adminId;
		this.regdate = regdate;
		this.hit = hit;
	}

}
