package data.dto;

import java.sql.Timestamp;

public class QuestionDto {

	private String q_num;
	private String q_writer;
	private String q_subject;
	private String q_content;
	private String q_image;
	private int q_likes;
	private int q_readcount;
	private Timestamp q_writeday;
	private int answercount;
	
	public String getQ_num() {
		return q_num;
	}
	public void setQ_num(String q_num) {
		this.q_num = q_num;
	}
	public String getQ_writer() {
		return q_writer;
	}
	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_image() {
		return q_image;
	}
	public void setQ_image(String q_image) {
		this.q_image = q_image;
	}
	public int getQ_likes() {
		return q_likes;
	}
	public void setQ_likes(int q_likes) {
		this.q_likes = q_likes;
	}
	public int getQ_readcount() {
		return q_readcount;
	}
	public void setQ_readcount(int q_readcount) {
		this.q_readcount = q_readcount;
	}
	public Timestamp getQ_writeday() {
		return q_writeday;
	}
	public void setQ_writeday(Timestamp q_writeday) {
		this.q_writeday = q_writeday;
	}
	public int getAnswercount() {
		return answercount;
	}
	public void setAnswercount(int answercount) {
		this.answercount = answercount;
	}
	
}
