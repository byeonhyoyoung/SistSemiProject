package data.dto;

import java.sql.Timestamp;

public class PaymentDto {
	
	private String payment_id;
	private String g_num;
	private String num;
	private int cnt;
	private Timestamp cartday;
	private Timestamp payment_date;
	
	public String getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}
	public String getG_num() {
		return g_num;
	}
	public void setG_num(String g_num) {
		this.g_num = g_num;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Timestamp getCartday() {
		return cartday;
	}
	public void setCartday(Timestamp cartday) {
		this.cartday = cartday;
	}
	public Timestamp getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Timestamp payment_date) {
		this.payment_date = payment_date;
	}
	
	
	
	
}
