package kr.co.korea.beans;

public class ReviewBean {
	
	private int r_ID;
	private int r_oID;
	private int r_mIDx;
	private int r_pID;
	private String r_TITLE;
	private String r_CONTENT;
	private String r_FILE1;
	private String r_FILE2;
	private String r_DATE;
	private int r_secret;
	
	
	private String r_mname;
	private String r_memail;
	
	private int FileCount;

	
	
	public int getR_pID() {
		return r_pID;
	}
	public void setR_pID(int r_pID) {
		this.r_pID = r_pID;
	}
	public int getR_secret() {
		return r_secret;
	}
	public void setR_secret(int r_secret) {
		this.r_secret = r_secret;
	}
	public String getR_mname() {
		return r_mname;
	}
	public void setR_mname(String r_mname) {
		this.r_mname = r_mname;
	}
	public String getR_memail() {
		return r_memail;
	}
	public void setR_memail(String r_memail) {
		this.r_memail = r_memail;
	}
	public int getFileCount() {
		return FileCount;
	}
	public void setFileCount(int fileCount) {
		FileCount = fileCount;
	}
	public int getR_ID() {
		return r_ID;
	}
	public void setR_ID(int r_ID) {
		this.r_ID = r_ID;
	}
	public int getR_oID() {
		return r_oID;
	}
	public void setR_oID(int r_oID) {
		this.r_oID = r_oID;
	}
	public int getR_mIDx() {
		return r_mIDx;
	}
	public void setR_mIDx(int r_mIDx) {
		this.r_mIDx = r_mIDx;
	}
	public String getR_TITLE() {
		return r_TITLE;
	}
	public void setR_TITLE(String r_TITLE) {
		this.r_TITLE = r_TITLE;
	}
	public String getR_CONTENT() {
		return r_CONTENT;
	}
	public void setR_CONTENT(String r_CONTENT) {
		this.r_CONTENT = r_CONTENT;
	}
	
	public String getR_FILE1() {
		return r_FILE1;
	}
	public void setR_FILE1(String r_FILE1) {
		this.r_FILE1 = r_FILE1;
	}
	public String getR_FILE2() {
		return r_FILE2;
	}
	public void setR_FILE2(String r_FILE2) {
		this.r_FILE2 = r_FILE2;
	}
	public String getR_DATE() {
		return r_DATE;
	}
	public void setR_DATE(String r_DATE) {
		this.r_DATE = r_DATE;
	}
	
	
}
