package kr.co.korea.beans;

import org.springframework.web.multipart.MultipartFile;

public class ProductBean extends Criteria{
	
	private int pID;
	private int p_top_idx;
	private int p_sub_idx;
	private String pNAME;
	private int pPRICE;
	private int pSTOCK;
	private MultipartFile upload_file;
	private MultipartFile upload_file2;
	private String pIMAGE1;
	private String pIMAGE2;
	private String pCONTENT;
	private String pDATE;
	private int phit;
	private int pdiscount;
	
	private String top_name;//idx출력하기 위한 값
	private String sub_name;//idx출력하기 위한 값
	
	private int imagecount;
	
	public int getImagecount() {
		return imagecount;
	}
	public void setImagecount(int imagecount) {
		this.imagecount = imagecount;
	}
	public MultipartFile getUpload_file2() {
		return upload_file2;
	}
	public void setUpload_file2(MultipartFile upload_file2) {
		this.upload_file2 = upload_file2;
	}
	public String getpIMAGE2() {
		return pIMAGE2;
	}
	public void setpIMAGE2(String pIMAGE2) {
		this.pIMAGE2 = pIMAGE2;
	}
	
	public String getTop_name() {
		return top_name;
	}
	public void setTop_name(String top_name) {
		this.top_name = top_name;
	}
	public String getSub_name() {
		return sub_name;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	public int getPdiscount() {
		return pdiscount;
	}
	public void setPdiscount(int pdiscount) {
		this.pdiscount = pdiscount;
	}
	public int getpID() {
		return pID;
	}
	public void setpID(int pID) {
		this.pID = pID;
	}
	public int getP_top_idx() {
		return p_top_idx;
	}
	public void setP_top_idx(int p_top_idx) {
		this.p_top_idx = p_top_idx;
	}
	public int getP_sub_idx() {
		return p_sub_idx;
	}
	public void setP_sub_idx(int p_sub_idx) {
		this.p_sub_idx = p_sub_idx;
	}
	public String getpNAME() {
		return pNAME;
	}
	public void setpNAME(String pNAME) {
		this.pNAME = pNAME;
	}
	public int getpPRICE() {
		return pPRICE;
	}
	public void setpPRICE(int pPRICE) {
		this.pPRICE = pPRICE;
	}
	public int getpSTOCK() {
		return pSTOCK;
	}
	public void setpSTOCK(int pSTOCK) {
		this.pSTOCK = pSTOCK;
	}
	public MultipartFile getUpload_file() {
		return upload_file;
	}
	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}
	public String getpIMAGE1() {
		return pIMAGE1;
	}
	public void setpIMAGE1(String pIMAGE1) {
		this.pIMAGE1 = pIMAGE1;
	}
	
	public String getpCONTENT() {
		return pCONTENT;
	}
	public void setpCONTENT(String pCONTENT) {
		this.pCONTENT = pCONTENT;
	}
	public String getpDATE() {
		return pDATE;
	}
	public void setpDATE(String pDATE) {
		this.pDATE = pDATE;
	}
	public int getPhit() {
		return phit;
	}
	public void setPhit(int phit) {
		this.phit = phit;
	}
}
