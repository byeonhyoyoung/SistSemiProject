package data.dto;

import java.sql.Timestamp;

public class ReviewDto {

	private String r_num;
	private String r_writer;
	private String r_subject;
	private String r_content;
	private String r_image;
	private int r_likes;
	private int r_readcount;
	private Timestamp r_writeday;
	private int answercount;
	
	
	public int getAnswercount() {
		return answercount;
	}
	public void setAnswercount(int answercount) {
		this.answercount = answercount;
	}
	public String getR_num() {
		return r_num;
	}
	public void setR_num(String r_num) {
		this.r_num = r_num;
	}
	public String getR_writer() {
		return r_writer;
	}
	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}
	public String getR_subject() {
		return r_subject;
	}
	public void setR_subject(String r_subject) {
		this.r_subject = r_subject;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_image() {
		return r_image;
	}
	public void setR_image(String r_image) {
		this.r_image = r_image;
	}
	public int getR_likes() {
		return r_likes;
	}
	public void setR_likes(int r_likes) {
		this.r_likes = r_likes;
	}
	public int getR_readcount() {
		return r_readcount;
	}
	public void setR_readcount(int r_readcount) {
		this.r_readcount = r_readcount;
	}
	public Timestamp getR_writeday() {
		return r_writeday;
	}
	public void setR_writeday(Timestamp r_writeday) {
		this.r_writeday = r_writeday;
	}
}