package data.dto;

import java.sql.Timestamp;

public class NotiDto {

   private String n_num;
   private String n_writer;
   private String n_subject;
   private String n_content;
   private String n_juje;
   private int n_readcount;
   private Timestamp n_writeday;
   
   public String getN_num() {
      return n_num;
   }
   public void setN_num(String n_num) {
      this.n_num = n_num;
   }
   public String getN_writer() {
      return n_writer;
   }
   public void setN_writer(String n_writer) {
      this.n_writer = n_writer;
   }
   public String getN_subject() {
      return n_subject;
   }
   public void setN_subject(String n_subject) {
      this.n_subject = n_subject;
   }
   public String getN_content() {
      return n_content;
   }
   public void setN_content(String n_content) {
      this.n_content = n_content;
   }
   public String getN_juje() {
      return n_juje;
   }
   public void setN_juje(String n_juje) {
      this.n_juje = n_juje;
   }
   public int getN_readcount() {
      return n_readcount;
   }
   public void setN_readcount(int n_readcount) {
      this.n_readcount = n_readcount;
   }
   public Timestamp getN_writeday() {
      return n_writeday;
   }
   public void setN_writeday(Timestamp n_writeday) {
      this.n_writeday = n_writeday;
   }
      
   
}