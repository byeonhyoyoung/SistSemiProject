package data.dto;

import java.sql.Timestamp;

public class QuestionAnswerDto {
	
	private String qa_idx;
	private String qa_num;
	private String qa_writer;
	private String qa_content;
	private Timestamp qa_writeday;
	
	public String getQa_idx() {
		return qa_idx;
	}
	public void setQa_idx(String qa_idx) {
		this.qa_idx = qa_idx;
	}
	public String getQa_num() {
		return qa_num;
	}
	public void setQa_num(String qa_num) {
		this.qa_num = qa_num;
	}
	public String getQa_writer() {
		return qa_writer;
	}
	public void setQa_writer(String qa_writer) {
		this.qa_writer = qa_writer;
	}
	public String getQa_content() {
		return qa_content;
	}
	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}
	public Timestamp getQa_writeday() {
		return qa_writeday;
	}
	public void setQa_writeday(Timestamp qa_writeday) {
		this.qa_writeday = qa_writeday;
	}
	
}
