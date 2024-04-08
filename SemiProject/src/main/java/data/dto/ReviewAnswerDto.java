package data.dto;

import java.sql.Timestamp;

public class ReviewAnswerDto {

	private String ra_idx;
	private String ra_num;
	private String ra_writer;
	private String ra_content;
	private Timestamp ra_writeday;
	
	
	public String getRa_idx() {
		return ra_idx;
	}
	public void setRa_idx(String ra_idx) {
		this.ra_idx = ra_idx;
	}
	public String getRa_num() {
		return ra_num;
	}
	public void setRa_num(String ra_num) {
		this.ra_num = ra_num;
	}
	public String getRa_writer() {
		return ra_writer;
	}
	public void setRa_writer(String ra_writer) {
		this.ra_writer = ra_writer;
	}
	public String getRa_content() {
		return ra_content;
	}
	public void setRa_content(String ra_content) {
		this.ra_content = ra_content;
	}
	public Timestamp getRa_writeday() {
		return ra_writeday;
	}
	public void setRa_writeday(Timestamp ra_writeday) {
		this.ra_writeday = ra_writeday;
	}
}
