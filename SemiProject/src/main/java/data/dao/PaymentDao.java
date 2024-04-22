package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.sql.Timestamp;

import data.dto.CartDto;
import data.dto.GiftDto;
import data.dto.PaymentDto;
import mysql.db.DbConnect;

public class PaymentDao {
   DbConnect db=new DbConnect();

   //필수> insert: 장바구니cart -> payment
   public void insertPayment(PaymentDto dto, String memberNum) {
       Connection conn = db.getConnection();
       PreparedStatement pstmt = null;

       String sql = "INSERT INTO payment (g_num, num, cnt, cartday, payment_date) " +
                    "SELECT g_num, ?, cnt, cartday, NOW() " +
                    "FROM cart " +
                    "WHERE num = ?";

       try {
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, memberNum); // Assuming memberNum is the member number
           pstmt.setString(2, memberNum); // Assuming memberNum is the member number

           pstmt.executeUpdate();
       } catch (SQLException e) {
           e.printStackTrace();
       } finally {
           db.dbClose(pstmt, conn);
       }
   }



 //필수> 전체 목록: 마이페이지 -> 결제 내역 확인용
   public List<PaymentDto> getAllPaymentsGroupedByDate() {
       List<PaymentDto> list = new ArrayList<PaymentDto>();

       Connection conn = db.getConnection();
       PreparedStatement pstmt = null;
       ResultSet rs = null;

       // SQL query to retrieve payments grouped by date
       String sql = "SELECT * FROM payment ORDER BY payment_date DESC";

       try {
           pstmt = conn.prepareStatement(sql);
           rs = pstmt.executeQuery();

           while (rs.next()) {
               PaymentDto dto = new PaymentDto();

               // Assuming PaymentDto has fields for all columns in the payment table
               dto.setPayment_id(rs.getString("payment_id"));
               dto.setG_num(rs.getString("g_num"));
               dto.setNum(rs.getString("num"));
               dto.setCnt(rs.getInt("cnt"));
               dto.setCartday(rs.getTimestamp("cartday"));
               dto.setPayment_date(rs.getTimestamp("payment_date"));

               list.add(dto);
           }
       } catch (SQLException e) {
           e.printStackTrace();
       } finally {
           db.dbClose(rs, pstmt, conn);
       }

       return list;
   }
   
   
 
 /////////////////////
   
 //필수> 전체 목록: 마이페이지 -> 결제 내역 확인용
   public List<PaymentDto> getAllPaymentsGroupedByDate2() {
	    List<PaymentDto> list = new ArrayList<PaymentDto>();

	    Connection conn = db.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    // SQL query to retrieve payments joined with gift information
	    String sql = "SELECT p.payment_id, p.g_num, p.num, p.cnt, p.cartday, p.payment_date, " +
	                 "g.g_name, g.g_price, g.g_image_1 " +
	                 "FROM payment p " +
	                 "INNER JOIN gift g ON p.g_num = g.g_num " +
	                 "ORDER BY p.payment_date DESC";

	    try {
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            PaymentDto dto = new PaymentDto();

	            // Set PaymentDto fields
	            dto.setPayment_id(rs.getString("payment_id"));
	            dto.setG_num(rs.getString("g_num"));
	            dto.setNum(rs.getString("num"));
	            dto.setCnt(rs.getInt("cnt"));
	            dto.setCartday(rs.getTimestamp("cartday"));
	            dto.setPayment_date(rs.getTimestamp("payment_date"));
	            
	            GiftDto gdto = new GiftDto();


	            // Set additional gift information
	            gdto.setG_name(rs.getString("g_name"));
	            gdto.setG_price(rs.getString("g_price"));
	            gdto.setG_image_1(rs.getString("g_image_1"));

	            list.add(dto);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        db.dbClose(rs, pstmt, conn);
	    }

	    return list;
	}

   

   ////////////
   
   
   
   
   //전체 목록: 상세 결제 페이지 -> 결제 내역 확인용:날짜 넣어서!!!
   public List<PaymentDto> getAllPaymentsGroupedByDate(Timestamp paymenttime) {
       List<PaymentDto> list = new ArrayList<PaymentDto>();

       Connection conn = db.getConnection();
       PreparedStatement pstmt = null;
       ResultSet rs = null;

       // SQL query to retrieve payments grouped by date
       String sql = "SELECT * FROM payment where payment_date=?";

       try {
           pstmt = conn.prepareStatement(sql);
           pstmt.setTimestamp(1, paymenttime);
           rs = pstmt.executeQuery();

           while (rs.next()) {
               PaymentDto dto = new PaymentDto();

               // Assuming PaymentDto has fields for all columns in the payment table
               dto.setPayment_id(rs.getString("payment_id"));
               dto.setG_num(rs.getString("g_num"));
               dto.setNum(rs.getString("num"));
               dto.setCnt(rs.getInt("cnt"));
               dto.setCartday(rs.getTimestamp("cartday"));
               dto.setPayment_date(rs.getTimestamp("payment_date"));

               list.add(dto);
           }
       } catch (SQLException e) {
           e.printStackTrace();
       } finally {
           db.dbClose(rs, pstmt, conn);
       }

       return list;
   }
   
   
   //전체 목록: 상세 결제 페이지 -> 결제 내역 확인용:회원 num 넣어서!!!
   public List<PaymentDto> getAllPaymentsGroupedByDate(String num) {
       List<PaymentDto> list = new ArrayList<PaymentDto>();

       Connection conn = db.getConnection();
       PreparedStatement pstmt = null;
       ResultSet rs = null;

       // SQL query to retrieve payments grouped by date
       String sql = "SELECT * FROM payment where num=?";
       
       

       try {
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, num);
           rs = pstmt.executeQuery();

           while (rs.next()) {
               PaymentDto dto = new PaymentDto();

               // Assuming PaymentDto has fields for all columns in the payment table
               dto.setPayment_id(rs.getString("payment_id"));
               dto.setG_num(rs.getString("g_num"));
               dto.setNum(rs.getString("num"));
               dto.setCnt(rs.getInt("cnt"));
               dto.setCartday(rs.getTimestamp("cartday"));
               dto.setPayment_date(rs.getTimestamp("payment_date"));

               list.add(dto);
           }
       } catch (SQLException e) {
           e.printStackTrace();
       } finally {
           db.dbClose(rs, pstmt, conn);
       }

       return list;
   }
   
   
   //전체 목록: 상세 결제 페이지 -> 결제 내역 확인용:회원 num 넣어서!!!
   public List<PaymentDto> getAllPaymentsGroupedByDate3(String num) {
       List<PaymentDto> list = new ArrayList<PaymentDto>();

       Connection conn = db.getConnection();
       PreparedStatement pstmt = null;
       ResultSet rs = null;

       // SQL query to retrieve payments grouped by date
       String sql = "SELECT * FROM payment where num=?";
       
       

       try {
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, num);
           rs = pstmt.executeQuery();

           while (rs.next()) {
               PaymentDto dto = new PaymentDto();

               // Assuming PaymentDto has fields for all columns in the payment table
               dto.setPayment_id(rs.getString("payment_id"));
               dto.setG_num(rs.getString("g_num"));
               dto.setNum(rs.getString("num"));
               dto.setCnt(rs.getInt("cnt"));
               dto.setCartday(rs.getTimestamp("cartday"));
               dto.setPayment_date(rs.getTimestamp("payment_date"));

               list.add(dto);
           }
       } catch (SQLException e) {
           e.printStackTrace();
       } finally {
           db.dbClose(rs, pstmt, conn);
       }

       return list;
   }
   
   
   
   //디테일 구매 페이지 리스트
   public List<PaymentDto> getAllPaymentsGroupedByDate2(String num ,Timestamp payment_date) {
	    List<PaymentDto> list = new ArrayList<PaymentDto>();

	    Connection conn = db.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    // SQL query to retrieve distinct payments for the given member number and payment date
	    
	    String sql = "SELECT c.idx, g.g_name, g.g_num, g.g_image_1, g.g_price, c.cnt, c.cartday " +
                "FROM cart c " +
                "INNER JOIN gift g ON c.g_num = g.g_num " +
                "INNER JOIN semimember m ON c.num = m.num " +
                "INNER JOIN payment p ON c.g_num = p.g_num " +
                "WHERE num = ? AND payment_date=?" +
                "ORDER BY c.cartday DESC";

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, num);
	        pstmt.setTimestamp(2, payment_date);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            PaymentDto dto = new PaymentDto();

	            // Assuming PaymentDto has fields for all columns in the payment table
	            dto.setPayment_id(rs.getString("payment_id"));
	            dto.setG_num(rs.getString("g_num"));
	            dto.setNum(rs.getString("num"));
	            dto.setCnt(rs.getInt("cnt"));
	            dto.setCartday(rs.getTimestamp("cartday"));
	            dto.setPayment_date(rs.getTimestamp("payment_date"));

	            list.add(dto);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        db.dbClose(rs, pstmt, conn);
	    }

	    return list;
	}


   //get data
   public PaymentDto getPayment(String payment_id)
   {
      PaymentDto dto=new PaymentDto();

      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;

      String sql="select * from gift where payment_id=?";

      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, payment_id);
         rs=pstmt.executeQuery();

         if(rs.next())
         {
            dto.setPayment_id(rs.getString("payment_id"));
             dto.setG_num(rs.getString("g_num"));
             dto.setNum(rs.getString("num"));
             dto.setCnt(rs.getInt("cnt"));
             dto.setCartday(rs.getTimestamp("cartday"));
             dto.setPayment_date(rs.getTimestamp("payment_date"));
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(rs, pstmt, conn);
      }

      return dto;
   }
   
   
 //내 결제 내역 확인
   public List<HashMap<String, String>> getMyPaymentList(String id) {
       List<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
       Connection conn = db.getConnection();
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       
       String sql = "SELECT c.idx, g.g_name, g.g_num, g.g_image_1, g.g_price, c.cnt, c.cartday " +
                    "FROM cart c " +
                    "INNER JOIN gift g ON c.g_num = g.g_num " +
                    "INNER JOIN semimember m ON c.num = m.num " +
                    "INNER JOIN payment p ON c.g_num = p.g_num " +
                    "WHERE m.id = ? AND DATE(p.payment_date) = DATE(NOW()) " +
                    "ORDER BY c.cartday DESC";
       
       try {
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, id);
           rs = pstmt.executeQuery();
           
           while (rs.next()) {
               HashMap<String, String> map = new HashMap<String, String>();
               
               map.put("idx", rs.getString("idx"));
               map.put("g_name", rs.getString("g_name"));
               map.put("g_num", rs.getString("g_num"));
               map.put("g_image_1", rs.getString("g_image_1"));
               map.put("g_price", rs.getString("g_price"));
               map.put("cnt", rs.getString("cnt"));
               map.put("cartday", rs.getString("cartday"));
               
               list.add(map);
           }
       } catch (SQLException e) {
           e.printStackTrace();
       } finally {
           db.dbClose(rs, pstmt, conn);
       }
       
       return list;
   }
   
   
   
   
   
   
   

}