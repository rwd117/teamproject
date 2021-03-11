package kr.co.korea.beans;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

public class ContentBean {

	private int content_idx;
	@NotBlank
	private String content_subject;
	
	@NotBlank
	private String content_text;
	private MultipartFile upload_file;   //멀티타트파일 자체를 전달
	private String content_file;         //파일명자체
	private int content_writer_idx;
	private int content_board_idx;
	private String content_date;
	private String content_write_name;  //로그인한 사람의 이름
	
	
	public int getContent_idx() {
		return content_idx;
	}
	public void setContent_idx(int content_idx) {
		this.content_idx = content_idx;
	}
	public String getContent_subject() {
		return content_subject;
	}
	public void setContent_subject(String content_subject) {
		this.content_subject = content_subject;
	}
	public String getContent_text() {
		return content_text;
	}
	public void setContent_text(String content_text) {
		this.content_text = content_text;
	}
	public MultipartFile getUpload_file() {
		return upload_file;
	}
	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}
	public String getContent_file() {
		return content_file;
	}
	public void setContent_file(String content_file) {
		this.content_file = content_file;
	}
	public int getContent_writer_idx() {
		return content_writer_idx;
	}
	public void setContent_writer_idx(int content_writer_idx) {
		this.content_writer_idx = content_writer_idx;
	}
	public int getContent_board_idx() {
		return content_board_idx;
	}
	public void setContent_board_idx(int content_board_idx) {
		this.content_board_idx = content_board_idx;
	}
	public String getContent_date() {
		return content_date;
	}
	public void setContent_date(String content_date) {
		this.content_date = content_date;
	}
	public String getContent_write_name() {
		return content_write_name;
	}
	public void setContent_write_name(String content_write_name) {
		this.content_write_name = content_write_name;
	}
	
}
